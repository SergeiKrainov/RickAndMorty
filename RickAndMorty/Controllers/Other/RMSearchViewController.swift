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
    
    private let config: Config
    
    //MARK: - Init
    
    init(config: Config) {
        self.config = config
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifycyrcle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = config.type.title
        view.backgroundColor = .systemMint
    }

}
