//
//  MemoryGame.swift
//  GuessingGame
//
//  Created by root on 1/28/21.
//  MODEL

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    var previousCardIndex: Int?
    var emojis = Emojis().emojis
    var score = Emojis().score
    
    init(noOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<noOfPairsOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    mutating func newGame(theme: String) {
        cards.removeAll()
        if let cardID = emojis[theme]?.count{
            for card in 0..<cardID{
                let content = emojis[theme]![card]
                cards.append(Card(content: content as! CardContent, id: card*2))
                cards.append(Card(content: content as! CardContent, id: card*2+1))
            }
            cards = cards.shuffled()
            score = 0
        }
    }
    
    mutating func choose(card: Card) {
        print("Card chosen is: \(card) ")
        
        if let chosenIndex = indexOf(of: card), !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
            
            if let potentialMatchIndex = previousCardIndex {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    if cards[chosenIndex].seen > 2 || cards[potentialMatchIndex].seen > 2{
                        score -= 3
                    }else{
                        score += 2
                    }
                }
                previousCardIndex = nil
            }
            else {
                for faceUps in cards.indices {
                    cards[faceUps].isFaceUp = false
                }
                previousCardIndex = chosenIndex
                
            }
            
            cards[chosenIndex].isFaceUp = true
            cards[chosenIndex].seen += 1
            
        }
        let cardsMatched = allCardsMatched()
        if  cardsMatched{
            for faceUps in cards.indices {
                cards[faceUps].isFaceUp = false
                cards[faceUps].isMatched = false
                cards[faceUps].seen = 0
                score = 0
            }
        }
    }
    
    func allCardsMatched() -> Bool {
        var counter = 0
        for matched in cards.indices {
            if cards[matched].isMatched{
                counter+=1
            }
        }
        print(counter)
        print(cards.count)
        if counter == cards.count {
            return true
        }else{
            return false
        }
    }
    
    func indexOf(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
    
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        var seen = 0
        var content: CardContent
        var id: Int
    }
}
