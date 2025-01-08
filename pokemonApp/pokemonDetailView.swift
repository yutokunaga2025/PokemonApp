//
//  pokemonDetailView.swift
//  pokemonApp
//
//  Created by Yu Tokunaga on 2025/01/08.
//

import SwiftUI

struct pokemonDetailView: View {
    let pokemon: (pokemonID: Int, name: String, imageURL: String)
    
    
    var body: some View {
        VStack {
            if let url = URL(string: pokemon.imageURL) {
                AsyncImage(url: url) { image in
                    image
                        .image?.resizable()
                    
                }
            }
            
            Text("ID: \(pokemon.pokemonID)")
            
            Text(pokemon.name.capitalized)
        }
    }
}
