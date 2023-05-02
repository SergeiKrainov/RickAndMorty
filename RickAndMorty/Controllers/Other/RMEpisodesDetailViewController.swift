//
//  RMEpisodesDetailViewController.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 01.05.2023.
//

import UIKit

/// VC to showdetails about single episode
final class RMEpisodesDetailViewController: UIViewController {
    private let viewModel: RMEpisodesDetailViewViewModel
    
    
    //MARK: - Init
    
    init(url: URL?) {
        self.viewModel = .init(endpointUrl: url)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Episode"
        
        view.backgroundColor = .systemGreen
    }

}
