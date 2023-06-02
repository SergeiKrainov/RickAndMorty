//
//  RMSearchInputViewViewModel.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 20.05.2023.
//

import Foundation

final class RMSearchInputViewViewModel {
    private let type: RMSearchViewController.Config.Types
    
    enum DynamicOptions: String {
        case status = "Status"
        case gender = "Gender"
        case locationType = "Location Type"
    }
    
    init(type: RMSearchViewController.Config.Types) {
        self.type = type
    }
    
    //MARK: - Public
    
    public var hasDynamicOptions: Bool {
        switch type {
        case .character, .location:
            return true
        case .episode:
            return false
        }
    }
    
    public var options: [DynamicOptions] {
        switch type {
        case .character:
            return [.status, .gender]
        case .episode:
            return []
        case .location:
            return [.locationType]
        }
    }
    
    public var searchPlaceholderText: String{
        switch type {
        case .character:
            return "Character Name"
        case .episode:
            return "Episode Title"
        case .location:
            return "Location Name"
        }
    }
}
