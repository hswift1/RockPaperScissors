//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by SoftDev Student on 1/18/19.
//  Copyright © 2019 Belle L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
   // @IBOutlet weak var computersLabel: UILabel!
    //@IBOutlet weak var computerLabel: UILabel!
    @IBOutlet weak var computersLabel: UILabel!
    @IBOutlet weak var winLoseOrDraw: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        resetGame()
    }
   
    func resetGame(){
        computersLabel.text = "👾"
        winLoseOrDraw.text = "Rock, Paper Scissors?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden = false
        paperButton.isEnabled = true
        scissorsButton.isHidden = false
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    func play(_ opponentTurn: Sign) {
        // disabling buttons so they cannot be pressed twice
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        //deciding who wins
        let player = randomSign()
       computersLabel.text = player.emoji
        let gameResult = opponentTurn.turn(player: player)
        
        switch gameResult {
        case .draw:
            winLoseOrDraw.text = "Looks like it's a draw!"
        case .lose:
            winLoseOrDraw.text = "Aw, you lost 😸"
        case .win:
            winLoseOrDraw.text = "Congradulations! You won!"
        case .start:
            winLoseOrDraw.text = "Rock, Paper, Scissors?"
        }
       
        //making it so the other buttons that were not selected
        switch opponentTurn {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true

        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false

        }
        //making the play again button available to click
        playAgainButton.isHidden = false
    }
    @IBAction func playAgain(_ sender: Any) {
        resetGame()
    }
    @IBAction func rockPressed(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func paperPressed(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func scissorsPressed(_ sender: Any) {
        play(Sign.scissors)
    }
    
}

