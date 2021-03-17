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
        let emojis = ["🧛🏻‍♀️","🧙🏻‍♀️","🦹🏻‍♀️","🧚🏻","🎃","💀","🍆", "🫀"]
        return MemoryGame<String>(noOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }

    // MARK: - Acces to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    
}
