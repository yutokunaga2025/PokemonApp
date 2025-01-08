import SwiftUI

struct PokemonCellView: View {
    let pokemon: (pokemonID: Int, name: String, imageURL: String)
    
    var body: some View {
        ZStack {
            //背景白
            Color.white
                .ignoresSafeArea()
            // 上半分（赤）
            Circle()
                .fill(Color.red)
                .frame(width: 200, height: 200)
            
            // 下半分（白）
            Circle()
                .fill(Color.white)
                .frame(width: 200, height: 200)
                .clipShape(Rectangle().offset(y: 100)) // 下半分のみ表示
                .overlay(
                    Circle()
                        .stroke(Color.black, lineWidth: 4) // 外枠を追加
                )
            
            VStack {
                // ポケモン画像
                if let url = URL(string: pokemon.imageURL) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                    } placeholder: {
                        ProgressView()
                    }
                }
                // ポケモンのIDと名前
                Text("ID: \(pokemon.pokemonID)")
                    .font(.caption)
                    .foregroundColor(.black)
                
                Text(pokemon.name.capitalized)
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
        .frame(width: 200, height: 200) // サイズを固定
    }
}

