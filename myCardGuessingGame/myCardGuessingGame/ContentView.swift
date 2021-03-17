//
//  ContentView.swift
//  GuessingGame
//
//  Created by root on 1/23/21.
// VIEW

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame // viewModel
                                  //  After this is called,
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        VStack {
            Text("Card Memory Game Commint Check 2")
                .font(.largeTitle)
                .fontWeight(.bold)
            GeometryReader{ geometry in
                
                LazyVGrid(columns: columns, spacing: 10){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }
                        .aspectRatio(CGSize(width: geometry.size.width, height: geometry.size.height), contentMode: .fit)
                    }
                }
                .frame(maxHeight: geometry.size.height)
                .padding()
                .foregroundColor(.blue)
            }
        }
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card //
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                if card.isFaceUp {
                    RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: strokeWidth)
                    Text(card.content)
                    
                }
                else {
                    RoundedRectangle(cornerRadius: 10).fill()
                }
                
            }.font(Font.system(size: min(geometry.size.width, geometry.size.height) * sizeFactor))
            
            .shadow(color: Color.primary.opacity(0.3), radius: 1)
        }

    }
    let strokeWidth: CGFloat = 3.0
    let cornerRadius: CGFloat = 10.0
    let sizeFactor: CGFloat = 0.95
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
