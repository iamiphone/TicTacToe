//
//  Player.swift
//  TicTacToe
//

import Foundation

struct Player {
    var moves = [Int]()
    
    // Adding Player positions
    mutating func addSlot(_ position: Int) {
        return self.moves.append(position)
    }
    
    // Player Choosed Positions count
    mutating func slotsCount() -> Int {
        return moves.count
    }
}
