//
//  GuessingGameApp.swift
//  GuessingGame
//
//  Created by root on 1/23/21.
//

import SwiftUI

@main
struct GuessingGameApp: App {
    var body: some Scene {
        let game = EmojiMemoryGame()
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
