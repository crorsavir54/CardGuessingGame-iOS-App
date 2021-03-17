//
//  MemoryGame.swift
//  GuessingGame
//
//  Created by root on 1/28/21.
//  MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var previous_chosen: Array<Card>
    
    init(noOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        previous_chosen = Array<Card>()
        for pairIndex in 0..<noOfPairsOfCards{
//        for pairIndex in 0..<Int.random(in: 2...noOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    mutating func choose(card: Card) {
        print("Card chosen is: \(card) ")
        let chosenIndex = indexOf(of: card)
        let isMatched = matched(of: cards[chosenIndex])
        flipCard(of: cards[chosenIndex])
        cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
        if isMatched.0{
            cards[chosenIndex].isMatched = true
            cards[isMatched.1].isMatched = true
        }
//        if !isMatched.0 v{
//            cards[chosenIndex].isFaceUp = !cards[chosenIndex].isFaceUp
//        }
//        else{
////            cards[chosenIndex].isMatched = true
////            cards[isMatched.1].isMatched = true
//            usleep(1000000)
//            let indexesToRemove: Set = [isMatched.1, chosenIndex]
//            cards = cards
//                .enumerated()
//                .filter { !indexesToRemove.contains($0.offset) }
//                .map { $0.element }
//
//        }

    }
    
    func indexOf(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 //TODO: Bogus!
    
    }
    
    func matched(of card: Card) -> (Bool, Int){
        
        for faceups in 0..<cards.count {
            if (cards[faceups].content == card.content) && (cards[faceups].isFaceUp && cards[faceups].id != card.id)
                && (cards[faceups].isMatched == false && card.isMatched == false ) {
                return (true, faceups)
            }
        }
        return (false, 0)
    }
    
    mutating func flipCard(of card: Card) {
        var counter = 0
        for faceups in 0..<cards.count {
            if cards[faceups].isFaceUp == true {
                counter+=1
            }
        }
        if counter == 2 {
            for faceups in 0..<cards.count {
                if cards[faceups].isFaceUp == true {
                    cards[faceups].isFaceUp = false
                }
            }
        }
    }
    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
        
    }
    
}
