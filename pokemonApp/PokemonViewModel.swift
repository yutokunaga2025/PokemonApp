//
//  PokemonViewModel.swift
//  pokemonApp
//
//  Created by Yu Tokunaga on 2025/01/08.
//

import Foundation

//APIにリクエストを送信し、データを取得する
class PokemonViewModel: ObservableObject {
    //151個の空文字が入った配列を用意。
    @Published var pokemonData: [(pokemonID: Int, name: String, imageURL: String)] = []
    
    init() {
        fetchAllPokemon()
    }
    
    func fetchPokemonInfo(for id: Int) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon/\(id)/")!
        
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            
            let json = try! JSONSerialization.jsonObject(with: data) as! [String: Any]
            
            let pokemonID = json["id"] as! Int
            let name = json["name"] as! String
            let sprites = json["sprites"] as! [String: Any]
            let imageURL = sprites["front_default"] as! String
            
            DispatchQueue.main.async {
                self.pokemonData.append((pokemonID: pokemonID, name: name, imageURL: imageURL))
                self.pokemonData.sort { $0.pokemonID < $1.pokemonID }
            }
        }
        task.resume()
    }
    
    func fetchAllPokemon() {
        for id in 1...151 {
            fetchPokemonInfo(for: id)
        }
    }
}
