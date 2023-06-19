//
//  RMSearchResultViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 19.06.2023.
//

import Foundation

enum RMSearchResultViewModel {
    
    case characters([RMCharacterCollectionViewCellViewModel])
    case episode([RMCharacterEpisodeCollectionViewCellViewModel])
    case locations([RMLocationTableViewCellViewModel])
}
