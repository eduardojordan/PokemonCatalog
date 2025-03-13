//
//  PokemonViewModel.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import Foundation
import SwiftUI
import Combine

class PokemonViewModel: ObservableObject {
    @Published var pokemonList: [PokemonModel] = []
    @Published var errorMessage: ErrorMessage?

    func fetchData() {
        APICaller.shared.getPokemon { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let pokemon):
                    self?.pokemonList = pokemon
                case .failure(let error):
                    self?.errorMessage = ErrorHandler.handleAPIError(error)
                }
            }
        }
    }
    
    func backgroundColor(forType type: String) -> UIColor {
        switch type {
        case "fire": return .systemRed
        case "poison": return .systemGreen
        case "water": return .systemTeal
        case "electric": return .systemYellow
        case "psychic": return .systemPurple
        case "normal": return .systemOrange
        case "ground": return .systemGray
        case "flying": return .systemBlue
        case "fairy": return .systemPink
        default : return .systemIndigo
        }
    }
}
