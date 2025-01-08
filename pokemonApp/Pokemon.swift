//
//  Pokemon.swift
//  pokemonApp
//
//  Created by Yu Tokunaga on 2025/01/08.
//

//ポケモンのデータモデルを定義する

import Foundation

struct Pokemon: Codable {
    let name: String
    let sprites: Sprites //画像
}

//キャメルキーに対応させる
struct Sprites: Codable {
    let frontDefault: String

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
