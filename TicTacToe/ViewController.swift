//
//  ViewController.swift
//  TicTacToe
//
//  Created by Mohammad Kiani on 2020-01-07.
//  Copyright © 2020 mohammadkiani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btnPlayAgain: UIButton!
    
    var activePlayer = 1
    var activeGame = true
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winnigCombinations = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        btnPlayAgain.isHidden = true
    }

    @IBAction func btnPressed(_ sender: UIButton) {
//        print(sender.tag)
        let activePosition = sender.tag - 1
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        for combination in winnigCombinations {
            print(gameState[combination[0]])
            if gameState[combination[0]] != 0 && gameState[combination[1]] == gameState[combination[2]] && gameState[combination[2]] == gameState[combination[0]] {
                
                // winner
                activeGame = false
                UIView.animate(withDuration: 1) {
                    self.btnPlayAgain.center = CGPoint(x: self.btnPlayAgain.center.x + 500, y: self.btnPlayAgain.center.y)
                }
                btnPlayAgain.isHidden = false
                resultLabel.isHidden = false
                
                if gameState[combination[0]] == 1 {
                    print("winner is nought")
                    resultLabel.text = "winner is nought"
                    
                } else {
                    print("winner is cross")
                    resultLabel.text = "winner is cross"
                }
                
            }
        }
    }
    @IBAction func playAgain(_ sender: UIButton) {
        gameState = [0,0,0,0,0,0,0,0,0]
        activeGame = true
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
        btnPlayAgain.isHidden = true
        resultLabel.isHidden = true
    }
    
}

