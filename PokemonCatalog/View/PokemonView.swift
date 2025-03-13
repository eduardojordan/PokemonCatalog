//
//  PokemonView.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import SwiftUI

struct PokemonView: View {
    @StateObject private var viewModel = PokemonViewModel()

    private let gridItems = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 16) {
                    ForEach(viewModel.pokemonList) { pokemon in
                        PokemonCell(pokemon: pokemon)
                    }
                }
                .padding()
            }
            .navigationTitle("Pokémon")
            .onAppear {
                viewModel.fetchData()
            }
            .alert(item: $viewModel.errorMessage) { error in
                Alert(
                    title: Text("Error"),
                    message: Text(error.message),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }
}
#Preview {
    PokemonView()
}
