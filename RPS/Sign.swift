//
//  Sign.swift
//  RPS
//
//  Created by Vokpolk on 10.04.2022.
//

import Foundation
import GameplayKit

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
    let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    
    var emoji: String {
        switch self {
        case .paper:
            return "👋🏻"
        case .rock:
            return "👊🏻"
        case .scissors:
            return "✌🏻"
        }
    }
    
    func getResult(for oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock), (.paper, .paper), (.scissors, .scissors):
            return .draw
        case (.paper, .rock), (.rock, .scissors), (.scissors, .paper):
            return .win
        case (.scissors, .rock), (.rock, .paper), (.paper, .scissors):
            return .lose
        }
    }
}
