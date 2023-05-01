//
//  RMCharacterEpisodeCollectionViewCellViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 28.04.2023.
//

import Foundation

final class RMCharacterEpisodeCollectionViewCellViewModel {
    
    private let episodeDataUrl: URL?
    
    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }
}
