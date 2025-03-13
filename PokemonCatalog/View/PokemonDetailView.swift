//
//  PokemonDetailView.swift
//  PokemonCatalog
//
//  Created by Eduardo Jordan on 13/3/25.
//

import Foundation
import SwiftUI

struct PokemonDetailView: View {
    let pokemon: PokemonModel
    let viewModel: PokemonViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color(viewModel.backgroundColor(forType: pokemon.type))
                .ignoresSafeArea()
            
            VStack(spacing: 16) {
                AsyncImage(url: URL(string: pokemon.imageUrl)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
                
                Text(pokemon.name.capitalized)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(pokemon.description ?? "")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                HStack(spacing: 20) {
                    VStack {
                        Text("Height")
                            .font(.headline)
                        Text("\(pokemon.height)")
                    }
                    VStack {
                        Text("Weight")
                            .font(.headline)
                        Text("\(pokemon.weight)")
                    }
                    VStack {
                        Text("Attack")
                            .font(.headline)
                        Text("\(pokemon.attack ?? 0)")
                    }
                    VStack {
                        Text("Defense")
                            .font(.headline)
                        Text("\(pokemon.defense ?? 0)")
                    }
                }
                .padding()
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle(pokemon.name.capitalized)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .imageScale(.large)
                }
            }
        }
    }
}
