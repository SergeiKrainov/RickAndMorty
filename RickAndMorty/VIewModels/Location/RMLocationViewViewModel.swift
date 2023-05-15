//
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 15.05.2023.
//

import Foundation

final class RMLocationViewViewModel {
    
    private var locations: [RMLocation] = []
    
    private var cellViewModels: [String] = []
    
    init() {}
    
    public func fetchLocations() {
        RMService.shared.execute(.listLocationRequest,
                                 expecting: String.self) { result in
            switch result {
            case .success(let success):
                break
            case .failure(let failure):
                break
            }
        }
    }
    
    private var hasMoreResults: Bool {
        return false
    }
    
    
}
