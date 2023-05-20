//
//  RMNoSearchResultsView.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 20.05.2023.
//

import UIKit

final class RMNoSearchResultsView: UIView {
    
    private let viewModel = RMNoSearchResultsViewViewModel()
    
    private let iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.contentMode = .scaleAspectFit
        iconView.tintColor = .systemBlue
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(iconView, label)
        addConstraints()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 90),
            iconView.widthAnchor.constraint(equalToConstant: 90),
            iconView.topAnchor.constraint(equalTo: topAnchor),
            iconView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            label.rightAnchor.constraint(equalTo: rightAnchor),
            label.leftAnchor.constraint(equalTo: leftAnchor),
            label.topAnchor.constraint(equalTo: iconView.bottomAnchor, constant: 10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func configure() {
        label.text = viewModel.title
        iconView.image = viewModel.image
    }

}
