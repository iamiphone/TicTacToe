//
//  Game.swift
//  TicTacToe
//

import Foundation
struct GameLogic {
    var arrWinPossibilities = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    var playerX = Player()
    var playerO = Player()
    var isCurrentPlayerX = true
    var isGameComplted = false
    
    // Start Game
    mutating func turnMove(selectedPosition: Int) {
        if isCurrentPlayerX {
            playerX.addSlot(selectedPosition)
        } else {
            playerO.addSlot(selectedPosition)
        }
    }
    
    // Check player was WON Game
    mutating func isWinner(player: Player) {
        for win in arrWinPossibilities {
            let playerMoves: Set = Set(player.moves)
            let winningArray: Set = Set(win)
            if(winningArray.isSubset(of: playerMoves)) {
                isGameComplted = true
                break
            }
        }
    }
    
    // Current Player
    func getCurrentPlayerString() -> String {
        return isCurrentPlayerX ? PLAYER_X : PLAYER_O
    }
    
    // Players are reached maximum game moves and game is available for draw
    mutating func isAvailableGameDraw() -> Bool {
        return (playerX.slotsCount() + playerO.slotsCount()) == GAME_REACHED_DRAWN_POSSIBILITIES
    }
    
    // Remove all selected player slots
    mutating func reset() {
        playerX.moves.removeAll()
        playerO.moves.removeAll()
        isCurrentPlayerX = true
        isGameComplted = false
    }
}
