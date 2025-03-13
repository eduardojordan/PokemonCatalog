//
//  Pokemon.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import Foundation

struct PokemonModel: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let attack: Int?
    let defense: Int?
    let description: String?
    let height: Int
    let weight: Int
}
