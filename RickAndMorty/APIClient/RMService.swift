//
//  RMService.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 22.04.2023.
//

import Foundation

/// Primary API service object to ger Rick and Morty data
final class RMService {
    /// Shared singlenton inctance
    static let shared = RMService()
    
    /// Privatized constructor
    private init() {}
    
    /// Send Rick and Morty API call
    /// - Parameters:
    ///   - request: Request inctance
    ///   - type: Type of object we expect to get back
    ///   - completion: Callback with data or error
    public func execute<T: Codable>(_ request: RMRequest,
                                    expecting type: T.Type,
                                    completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
