//
//  GameViewController.swift
//  TicTacToe
//

import UIKit

class GameViewController: UIViewController, GameBoardResultDelegate {
    
    @IBOutlet weak private var lblResult: UILabel!
    private var game = GameLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblResult.text = game.playerHasToMove()
        game.delegate = self as GameBoardResultDelegate
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        clearBoardContent()
    }
    
    @IBAction func selectPlayerPosition(_ sender: DesignableButton) {
        guard game.isValidPosition(validatePosition: sender.tag) else { showAlertPlayerHasSelectedInvalidPosition()
            return
        }
        sender.selectedButtonIndex(index: sender.tag, player: game.getCurrentPlayerString())
        game.playerSelectedPosition(selectedPosition: (sender.tag))        
    }
    
    // MARK: - Game Board Result Delegate Method
    
    func gameResultData(resultData: String, isGameCompleted: Bool) {
        lblResult.text = resultData
        if isGameCompleted {
            gameFinished()
        }
    }
    
    // MARK: - Game Completed
    // clear board content boxes
    func clearBoardContent() {
        for index in START_TAG...END_TAG {
            let btnSlot = self.view.viewWithTag(index) as? DesignableButton
            btnSlot?.clearButtonContent(btnSlot!)
        }
        game.resetGameBoard()
        lblResult.text = game.playerHasToMove()
    }
    
    func gameFinished() {
        for index in START_TAG...END_TAG {
            let btnSlot = self.view.viewWithTag(index) as? DesignableButton
            btnSlot?.isUserInteractionEnabled = false
        }
    }
    
    // MARK: - Selected Invalid Position Alert
    func showAlertPlayerHasSelectedInvalidPosition() {
        let alert = UIAlertController(title: "Invalid Selection", message: "PLAYER-\(game.getCurrentPlayerString()) \n Please Select a Valid Position", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
