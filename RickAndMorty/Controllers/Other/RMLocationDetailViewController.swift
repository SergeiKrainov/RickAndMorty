//
//  RMLocationDetailViewController.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 17.05.2023.
//

import UIKit

/// VC to showdetails about single location
final class RMLocationDetailViewController: UIViewController, RMLocationDetailViewViewModelDelegate, RMLocationDetailViewDelegate {
    
    private let viewModel: RMLocationDetailViewViewModel
    
    private let detailView = RMLocationDetailView()
    
    //MARK: - Init
    
    init(location: RMLocation) {
        let url = URL(string: location.url)
        self.viewModel = RMLocationDetailViewViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Location"
        view.addSubview(detailView)
        detailView.delegate = self
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchLocationData()
    }
    
    @objc
    private func didTapShare() {
        // share info
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    //MARK: - ViewModel Delegate
    
    func didFetchLocationDetails() {
        detailView.configure(with: viewModel)
    }
    
    //MARK: - View Delegate
    
    func rmLocationDetailView(_ episodeView: RMLocationDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        navigationController?.pushViewController(vc, animated: true)
    }

}
