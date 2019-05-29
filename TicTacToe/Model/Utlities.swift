//
//  Utlities.swift
//  TicTacToe
//

import Foundation

extension Array {
    func randomItem() -> Element? {
        if isEmpty { return nil }
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
}

let PLAYER_ONE_WON = "PLAYER 1 Won"
let PLAYER_TWO_WON = "PLAYER 2 Won"
let MATCH_DRAWN = "Match Drawn"
let PLAYER_ONE = "P1"
let PLAYER_TWO = "P2"
let SELECTED_SLOT_NONE = "-"
let MINIMUM_POSSIBILITY_STEPS = 3

