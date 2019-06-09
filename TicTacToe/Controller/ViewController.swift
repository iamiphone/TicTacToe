//
//  ViewController.swift
//  TicTacToe
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblResult: UILabel!
    var game = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = playerHasToMove()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        clearBoardContent()
    }
    
    // clear board content boxes
    func clearBoardContent() {
        for index in START_TAG...END_TAG {
            let btnSlot = self.view.viewWithTag(index) as? DesignableButton
            btnSlot?.clearButtonContent(btnSlot!)
        }
        game.reset()
        lblResult.text = playerHasToMove()
    }
    
    @IBAction func selectPlayerPosition(_ sender: DesignableButton) {
        sender.selectedButtonIndex(index: sender.tag, player: game.getCurrentPlayerString())
        game.turnMove(selectedPosition: (sender.tag))
        
        game.isWinner(player: (game.isCurrentPlayerX) ? game.playerX : game.playerO)
        
        if game.isGameComplted {
            lblResult.text = playerWon()
            gameFinished()
        } else {
            game.isCurrentPlayerX.toggle()
            if(game.isAvailableGameDraw()) {
                lblResult.text = MATCH_DRAWN
            } else {
                lblResult.text = playerHasToMove()
            }
        }
    }
    
    func gameFinished() {
        for index in START_TAG...END_TAG {
            let btnSlot = self.view.viewWithTag(index) as? DesignableButton
            btnSlot?.isUserInteractionEnabled = false
        }
    }
    
    func playerHasToMove() -> String {
        return "Player-\(game.getCurrentPlayerString()) Turn ✅"
    }
    
    func playerWon() -> String {
        return "Player-\(game.getCurrentPlayerString()) has WON 👍"
    }
}
