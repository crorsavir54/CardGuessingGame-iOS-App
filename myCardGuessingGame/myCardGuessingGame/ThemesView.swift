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
        HStack{
            Button(action: {
                viewModel.newGame(theme: "Tao")
            }) {
                HStack {
                    Text("🧍🏻")
                    Text("1")
                        .font(.system(.body ,design: .rounded))
                        .fontWeight(.regular)
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button(action: {
                viewModel.newGame(theme: "Objects")
            }) {
                HStack {
                    Text("⚽️")
                    Text("2")
                        .font(.system(.body ,design: .rounded))
                        .fontWeight(.regular)
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Button(action: {
                viewModel.newGame(theme: "Animals")
            }) {
                HStack {
                    Text("🦁")
                    Text("3")
                        .font(.system(.body ,design: .rounded))
                        .fontWeight(.regular)
                }
                .padding()
                .background(Color.purple)
                .shadow(radius: 10)
                .foregroundColor(.white)
                .cornerRadius(10)
                
            }
        }.shadow(color: .gray, radius: 2, x: 0, y: 2)
            
        }
        
}
