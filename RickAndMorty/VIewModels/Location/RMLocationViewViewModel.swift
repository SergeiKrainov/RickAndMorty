//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 15.05.2023.
//

import Foundation

protocol RMLocationViewViewModelDelegate: AnyObject {
    func didFetchInitialLocation()
}

final class RMLocationViewViewModel {
    
    weak var delegate: RMLocationViewViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationTableViewCellViewModel(location: location)
                if !cellViewModels.contains(cellViewModel) {
                    cellViewModels.append(cellViewModel)
                }
            }
        }
    }
    
    private var apiInfo: RMGetAllLocationResponse.Info?
    
    private var didFinishPagination: (() -> Void)?
    
    public private(set) var cellViewModels: [RMLocationTableViewCellViewModel] = []
    
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
    
    public var isLoadingMoreLocation = false
    
    //MARK: - Init
    
    init() {}
    
    //MARK: - Public
    
    public func registerDidFinishPaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block
    }
    
    /// Paginate if additional locations are needed
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocation else {return}
        
        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {return}
        
        isLoadingMoreLocation = true
        
        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocation = false
            return
        }
        
        RMService.shared.execute(request,
                                 expecting: RMGetAllLocationResponse.self) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                self.apiInfo = info
                self.cellViewModels.append(contentsOf: moreResults.compactMap({
                    return RMLocationTableViewCellViewModel(location: $0)
                }))
                
                DispatchQueue.main.async {
                    self.isLoadingMoreLocation = false
                    // Notify via callback
                    self.didFinishPagination?()
                }
            case .failure(let failure):
                print(String(describing: failure))
                isLoadingMoreLocation = false
            }
        }
    }
    
    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return locations[index]
    }
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationRequest,
                                 expecting: RMGetAllLocationResponse.self) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocation()
                }
            case .failure:
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
    
    
}
