//
//  RMEndpoint.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 22.04.2023.
//

import Foundation

/// Represents unique API endpoints
@frozen enum RMEndpoint: String, Hashable, CaseIterable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get location info
    case location
    /// Endpoint to get episode info
    case episode
}
