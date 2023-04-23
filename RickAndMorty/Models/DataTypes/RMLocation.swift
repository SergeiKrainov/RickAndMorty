//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by Сергей Крайнов on 22.04.2023.
//

import Foundation

struct RMLocation: Codable {
    let id: Int
    let name: String
    let type: String
    let demension: String
    let residents: [String]
    let url: String
    let reated: String
}
