//
//  ContentView.swift
//  pokemonApp
//
//  Created by Yu Tokunaga on 2024/12/04.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = PokemonViewModel()
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
        ]
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(viewModel.pokemonData, id: \.pokemonID) { pokemon in
                        NavigationLink(destination: pokemonDetailView(pokemon: pokemon)) {
                            PokemonCellView(pokemon: pokemon)
                        }
                    }
                }
                .navigationTitle("Pokemon List")
            }
        }
    }
}


#Preview {
    ContentView()
}
