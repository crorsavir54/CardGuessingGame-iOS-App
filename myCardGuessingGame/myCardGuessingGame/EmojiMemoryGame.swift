//
//  EmojiMemoryGame.swift
//  GuessingGame
//
//  Created by root on 1/28/21.
//  VIEWMODEL "middleman" between the view and model, it will always be a class

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

//  function
   static func createMemoryGame() -> MemoryGame<String> {
        let emojis = [0: ["👯‍♀️", "🕺🏻", "👩‍🦽", "🧎🏻‍♀️"],
                      1:["🧤","🧣","🎩","🎓"],
                      2:["🐶","🐱","🐭","🐰","🦊","🐻","🐼"]
        ]
        let randomizer = Int.random(in: 1..<emojis.count)
        return MemoryGame<String>(noOfPairsOfCards: emojis[randomizer]!.count) { pairIndex in
            return emojis[randomizer]![pairIndex]
        }
    }
    // MARK: - Acces to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    
    func newGame(theme: String) {
        model.newGame(theme: theme)
    }
    
    // MARK: - Intent
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
//    
//    func newGame() {
//        model.newGame()
//    }
}
