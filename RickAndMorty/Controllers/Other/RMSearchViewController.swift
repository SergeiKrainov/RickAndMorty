//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 03.05.2023.
//

import UIKit

/// Configurable controller to search
final class RMSearchViewController: UIViewController {
    
    struct Config {
        enum Types {
            case character
            case episode
            case location
        }
        
        let type: Types
    }
    
    private let config: Config
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Search"
        view.backgroundColor = .systemMint
    }

}
