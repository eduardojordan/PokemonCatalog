//
//  Pokemon.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import Foundation

struct Pokemon: Decodable, Identifiable {
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
}
