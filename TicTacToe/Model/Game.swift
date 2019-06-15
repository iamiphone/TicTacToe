//
//  Game.swift
//  TicTacToe
//

protocol GameBoardResultDelegate {
    func gameResultData(resultData: String, isGameCompleted: Bool)
}

import Foundation
struct GameLogic {
    var gameWinPossibilities = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    var playerX = Player()
    var playerO = Player()
    var isCurrentPlayerX = true
    var isGameComplted = false
    var delegate: GameBoardResultDelegate?
    
    // Start Game
    mutating func turnMove(selectedPosition: Int) {
        if isCurrentPlayerX {
            playerX.playerSelectedPosition(selectedPosition)
        } else {
            playerO.playerSelectedPosition(selectedPosition)
        }
        checkGameResult()
    }
    
    mutating func checkGameResult() {
        if isGameHasWinningPosiotions() {
            isWinner(player: (isCurrentPlayerX) ? playerX : playerO)
        }
        
        if isGameComplted {
            delegate?.gameResultData(resultData: playerWon(), isGameCompleted: true)
        } else {
            isCurrentPlayerX.toggle()
            if(isAvailableGameDraw()) {
                delegate?.gameResultData(resultData: MATCH_DRAWN, isGameCompleted: true)
            } else {
                delegate?.gameResultData(resultData: playerHasToMove(), isGameCompleted: false)
            }
        }
    }
    
    func playerHasToMove() -> String {
        return "Player-\(getCurrentPlayerString()) Turn ✅"
    }
    
    func playerWon() -> String {
        return "Player-\(getCurrentPlayerString()) has WON 👍"
    }
    
    // Check player was WON Game
    mutating func isWinner(player: Player) {
        for win in gameWinPossibilities {
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
    
    // Check Game has win positions
    mutating func isGameHasWinningPosiotions() -> Bool {
        return (playerX.moves.count + playerO.moves.count) >= GAME_REACHED_WINNING_POSSIBILITIES
    }
    
    // Players are reached maximum game moves and game is available for draw
    mutating func isAvailableGameDraw() -> Bool {
        return (playerX.moves.count + playerO.moves.count) == GAME_REACHED_DRAWN_POSSIBILITIES
    }
    
    // Remove all selected player slots
    mutating func reset() {
        playerX.moves.removeAll()
        playerO.moves.removeAll()
        isCurrentPlayerX = true
        isGameComplted = false
    }
}
