//
//  Player.swift
//  TicTacToe
//

import Foundation

struct Player {
    var moves = [Int]()
    
    // Add player moves
    mutating func selectdPosition(_ position: Int) {
        return self.moves.append(position)
    }
}
