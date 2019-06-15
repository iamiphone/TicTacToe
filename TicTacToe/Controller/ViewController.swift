//
//  ViewController.swift
//  TicTacToe
//

import UIKit

class ViewController: UIViewController, GameBoardResultDelegate {
    
    @IBOutlet weak var lblResult: UILabel!
    var game = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = game.playerHasToMove()
        game.delegate = self as GameBoardResultDelegate
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
        lblResult.text = game.playerHasToMove()
    }
    
    @IBAction func selectPlayerPosition(_ sender: DesignableButton) {
        sender.selectedButtonIndex(index: sender.tag, player: game.getCurrentPlayerString())
        game.turnMove(selectedPosition: (sender.tag))        
    }
    
    func gameResultData(resultData: String, isGameCompleted: Bool) {
        lblResult.text = resultData
        if isGameCompleted {
            gameFinished()
        }
    }
    
    func gameFinished() {
        for index in START_TAG...END_TAG {
            let btnSlot = self.view.viewWithTag(index) as? DesignableButton
            btnSlot?.isUserInteractionEnabled = false
        }
    }
}
