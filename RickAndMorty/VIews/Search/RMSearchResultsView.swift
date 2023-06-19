//
//  RMSearchResultsView.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 19.06.2023.
//

import UIKit

/// Search results UI (collection or table as needed)
final class RMSearchResultsView: UIView {
    private var viewModel: RMSearchResultViewModel? {
        didSet {
            self.processViewModel()
        }
    }
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(RMLocationTableViewCell.self,
                           forCellReuseIdentifier: RMLocationTableViewCell.cellIdentifier)
        tableView.isHidden = true
        return tableView
    }()
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        addSubViews(tableView)
        translatesAutoresizingMaskIntoConstraints = false
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Public
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        tableView.backgroundColor = .yellow
    }
    
    private func processViewModel() {
        guard let viewModel = viewModel else { return }
        
        switch viewModel {
        case .characters(let viewModels):
            setUpCollectionView()
        case .episode(let viewModels):
            setUpTableView()
        case .locations(let viewModels):
            setUpCollectionView()
        }
    }
    
    private func setUpCollectionView() {
        tableView.isHidden = false
    }
    
    private func setUpTableView() {
        
    }
    
    //MARK: - Public
    
    public func configure(with viewModel: RMSearchResultViewModel) {
        self.viewModel = viewModel
    }

}
