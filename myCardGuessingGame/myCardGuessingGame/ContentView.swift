//
//  ContentView.swift
//  GuessingGame
//
//  Created by root on 1/23/21.
// VIEW

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame // viewModel
    
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4) // TODO: calculated column count
    
    var body: some View {
        let score = String(viewModel.score)
        GeometryReader{ geometry in
            VStack {
                HStack{
                    Text("Score: \(score)" )
                        .bold()
                        .padding()
                    ThemesView(viewModel: viewModel)
                }
                Divider()
                LazyVGrid(columns: columns){
                    ForEach(viewModel.cards){ card in
                        CardView(card: card).onTapGesture {
                            viewModel.choose(card: card)
                        }.aspectRatio(geometry.size, contentMode: .fit).padding(5)
                        
                    }
                }
                
            } .padding()
        }
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card //
    
    
    var body: some View {
        GeometryReader{ geometry in
            ZStack {
                if card.isFaceUp {
                    Text(card.content)
                    RoundedRectangle(cornerRadius: cornerRadius).strokeBorder(lineWidth: strokeWidth)
                    
                }
                else {
                    if card.isMatched{
                    }else{
                        RoundedRectangle(cornerRadius: 10).fill(
                            LinearGradient(gradient: Gradient(colors: [.pink, .purple, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                    }
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
