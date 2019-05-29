//
//  ViewController.swift
//  TicTacToe
//

import UIKit

class ViewController: UIViewController,PlayerSelectedSlotDelegate {
    
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        clearBoardContent()
    }
    
    @IBAction func startButtonPressed(_ sender: Any) {
        clearBoardContent()
        var game = GameLogic()
        game.delegate = self as PlayerSelectedSlotDelegate
        game.isInitialStepMovedByPlayerOne()
        game.isSlotSelectByRandom()
        lblResult.text = "\(game.startGame())"
        game.reset()
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        clearBoardContent()
        lblResult.text = ""
    }
    
    // clear board content boxes
    func clearBoardContent() {
        for index in 501...509 {
            let tmpButton1 = self.view.viewWithTag(index) as? UIButton
            tmpButton1?.setTitle(SELECTED_SLOT_NONE, for: .normal)
        }
    }
    
    // PlayerSelectedSlotDelegate method implementation
    func selectedSlotPositionByPlayer(position: Int, player: String) {
        let tmpButton2 = self.view.viewWithTag(500+position) as? UIButton
        tmpButton2?.setTitle(player, for: .normal)
    }
}
