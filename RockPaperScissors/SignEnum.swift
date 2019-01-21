//
//  SignEnum.swift
//  RockPaperScissors
//
//  Created by SoftDev Student on 1/20/19.
//  Copyright © 2019 Belle L. All rights reserved.
//

import Foundation
import GameplayKit

//generating a random sign

let randomChoice = GKRandomDistribution(lowestValue: 0, highestValue: 2)

func randomSign() -> Sign {
 let sign = randomChoice.nextInt()
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
        }else {
        return .scissors
    }
    
}


//enum for signs
enum Sign {
    
    case rock, paper, scissors
    
    // calculated properties for emojis that represent the signs
    var emoji: String {
        switch self {
        case .rock:
            return "✊"
        case .paper:
            return "🖐"
        case .scissors:
            return "✌️"
        
        }
    }
    
    func turn(player: Sign) -> GameState {
        switch self {
        case .rock:
    // referencing each case (rock, paper,scissors) against the player with each possible scenario
            switch player {
            case .rock:
                return GameState.draw
            case .paper:
                return GameState.lose
            case .scissors:
                return GameState.win
            }
        case .paper:
            switch player {
            case .rock:
                return GameState.win
            case .paper:
                return GameState.draw
            case .scissors:
                return GameState.lose
            }
        case .scissors:
            switch player {
            case .rock:
                return GameState.lose
            case .paper:
                return GameState.win
            case .scissors:
                return GameState.draw
            }
        
        }
    }
}
