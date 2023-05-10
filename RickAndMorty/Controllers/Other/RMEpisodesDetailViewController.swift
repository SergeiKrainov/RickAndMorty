//
//  RMEpisodesDetailViewController.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 01.05.2023.
//

import UIKit

/// VC to showdetails about single episode
final class RMEpisodesDetailViewController: UIViewController, RMEpisodesDetailViewViewModelDelegate, RMEpisodesDetailViewDelegate {
    
    private let viewModel: RMEpisodesDetailViewViewModel
    
    private let detailView = RMEpisodesDetailView()
    
    //MARK: - Init
    
    init(url: URL?) {
        self.viewModel = RMEpisodesDetailViewViewModel(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Episode"
        view.addSubview(detailView)
        detailView.delegate = self
        addConstraints()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(didTapShare))
        viewModel.delegate = self
        viewModel.fetchEpisodeData()
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
    
    func didFetchEpisodDetails() {
        detailView.configure(with: viewModel)
    }
    
    //MARK: - View Delegate
    
    func rmEpisodeDetailView(_ episodeView: RMEpisodesDetailView, didSelect character: RMCharacter) {
        let vc = RMCharacterDetailViewController(viewModel: .init(character: character))
        navigationController?.pushViewController(vc, animated: true)
    }

}
