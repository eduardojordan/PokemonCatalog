//
//  PokemonCell.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 12/3/25.
//

import SwiftUI

struct PokemonCell: View {
    let pokemon: PokemonModel
    let viewmodel: PokemonViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 8)
                    .padding(.leading)

                HStack {
                    Text(pokemon.type)
                        .font(.subheadline).bold()
                        .foregroundColor(.white)
                        .frame(width: 60, height: 24)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background(Color.white.opacity(0.25))

                        .clipShape(RoundedRectangle(cornerRadius: 20))

                    AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .scaledToFit()
                    .frame(width: 65, height: 65)
                    .padding([.bottom, .trailing], 4)
                }
                     .padding(.horizontal)
            }
        }
        .background(Color(viewmodel.backgroundColor(forType: pokemon.type)))
        .fixedSize(horizontal: false, vertical: true)
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    PokemonCell(pokemon: PokemonModel(
    id: 25,
      name: "Pikachu",
      imageUrl: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/25.png",
      type: "Electric",
      attack: 55,
      defense: 40,
      description: "Pikachu is an Electric-type Pokémon known for its electric powers.",
      height: 4,
    weight: 60 
    
    ), viewmodel: PokemonViewModel())
}
