//
//  RMSearchView.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 20.05.2023.
//

import UIKit

protocol RMSearchViewDelegate: AnyObject {
    func rmSearchView(_ searchView: RMSearchView,
                      didSelectOption option: RMSearchInputViewViewModel.DynamicOptions)
}

final class RMSearchView: UIView {
    
    weak var delegate: RMSearchViewDelegate?
    
    private let viewModel: RMSearchViewViewModel
    
    //MARK: - SubViews
    
    private let searchView = RMSearchInputView()
    
    private let noResultView = RMNoSearchResultsView()
    
    //MARK: - Init

    init(frame: CGRect, viewModel: RMSearchViewViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)
        backgroundColor = .systemBackground
        translatesAutoresizingMaskIntoConstraints = false
        addSubViews(noResultView, searchView)
        addConstraints()
        
        searchView.configure(with: .init(type: viewModel.config.type))
        searchView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            // searchView
            searchView.topAnchor.constraint(equalTo: topAnchor),
            searchView.leftAnchor.constraint(equalTo: leftAnchor),
            searchView.rightAnchor.constraint(equalTo: rightAnchor),
            searchView.heightAnchor.constraint(equalToConstant: viewModel.config.type == .episode ? 55 : 110),
            
            // noResult
            noResultView.widthAnchor.constraint(equalToConstant: 150),
            noResultView.heightAnchor.constraint(equalToConstant: 150),
            noResultView.centerXAnchor.constraint(equalTo: centerXAnchor),
            noResultView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func presentKeyBoard() {
        searchView.presentKeyBoard()
    }
}

//MARK: - RMSearchInputViewDelegate

extension RMSearchView: RMSearchInputViewDelegate {
    func rmSearchInputView(_ inputView: RMSearchInputView, didSelectOption option: RMSearchInputViewViewModel.DynamicOptions) {
        delegate?.rmSearchView(self, didSelectOption: option)
    }
}

//MARK: - CollectionView

extension RMSearchView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}
