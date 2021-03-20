//
//  ThemesView.swift
//  myCardGuessingGame
//
//  Created by root on 3/21/21.
//

import SwiftUI

struct ThemesView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
        
        Button(action: {
            viewModel.newGame(theme: "Tao")
        }) {
            HStack {
                Text("🧍🏻")
                Text("Tao")
                    .font(.system(.body ,design: .rounded))
                    .fontWeight(.regular)
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        Button(action: {
            viewModel.newGame(theme: "Objects")
        }) {
            HStack {
                Text("⚽️")
                Text("Objects")
                    .font(.system(.body ,design: .rounded))
                    .fontWeight(.regular)
            }
        
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        
        Button(action: {
            viewModel.newGame(theme: "Animals")
        }) {
            HStack {
                Text("🦁")
                Text("Animals")
                    .font(.system(.body ,design: .rounded))
                    .fontWeight(.regular)
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
    }
}
