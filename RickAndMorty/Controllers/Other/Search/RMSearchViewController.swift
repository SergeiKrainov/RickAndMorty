//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 03.05.2023.
//

import UIKit

/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    /// Configuration for search session
    struct Config {
        enum Types {
            case character
            case episode
            case location
            
            var endpoint: RMEndpoint {
                switch self {
                case .character:
                    return .character
                case .episode:
                    return .episode
                case .location:
                    return .location
                }
            }
            
            var title: String {
                switch self {
                case .character:
                    return "Search Characters"
                case .location:
                    return "Search Location"
                case .episode:
                    return "Search Episode"
                }
            }
        }
        
        let type: Types
    }
    
    private let viewModel: RMSearchViewViewModel
    private let searchView: RMSearchView
    
    //MARK: - Init
    
    init(config: Config) {
        let viewModel = RMSearchViewViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifycyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubview(searchView)
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(searchButtonTapped))
        searchView.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchView.presentKeyBoard()
    }
    
    @objc
    private func searchButtonTapped() {
        viewModel.executeSearch()
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - RMSearchViewDelegate

extension RMSearchViewController: RMSearchViewDelegate {
    func rmSearchView(_ inputView: RMSearchView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions) {
        let vc = RMSearchOptionPickerViewController(option: option) { [weak self] selection in
            DispatchQueue.main.async {
                self?.viewModel.set(value: selection, for: option)
            }
        }
        vc.sheetPresentationController?.detents = [.medium()]
        vc.sheetPresentationController?.prefersGrabberVisible = true
        present(vc, animated: true)
    }
    
    func rmSearchView(_ searchView: RMSearchView, didSelectLocation location: RMLocation) {
        let vc = RMLocationDetailViewController(location: location)
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
}
