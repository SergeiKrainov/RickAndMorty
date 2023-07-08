//
//  RMTableFooterLoadingView.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 05.07.2023.
//

import UIKit

final class RMTableLoadingFooterView: UIView {
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView()
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        return spinner
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(spinner)
        spinner.startAnimating()
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraint() {
        NSLayoutConstraint.activate([
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            spinner.heightAnchor.constraint(equalToConstant: 55),
            spinner.widthAnchor.constraint(equalToConstant: 55)
        ])
    }
}
