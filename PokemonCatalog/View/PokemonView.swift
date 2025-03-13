//
//  PokemonView.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import SwiftUI

struct PokemonView: View {
    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16){
                    ForEach(0..<151) { _ in
                        PokemonCell()
                    }
                }
            }
            .navigationTitle("Pokemons")
        }
    }
}

#Preview {
    PokemonView()
}
