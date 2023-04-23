//
//  RMGetAllCharactesResponse.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 23.04.2023.
//

import Foundation

struct RMGetAllCharactesResponse: Codable {
    let info: Info
    let results: [RMCharacter]
}

struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
