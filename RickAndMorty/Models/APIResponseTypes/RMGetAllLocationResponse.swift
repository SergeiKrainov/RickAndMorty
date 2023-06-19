//
//  RMGetLocationResponse.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 16.05.2023.
//

import Foundation

struct RMGetAllLocationResponse: Codable {
    struct Info: Codable {
        let count: Int
        let pages: Int
        let next: String?
        let prev: String?
    }
    let info: Info
    let results: [RMLocation]
}
