//
//  Game.swift
//  TicTacToe
//

protocol GameBoardResultDelegate {
    func gameResultData(resultData: String, isGameCompleted: Bool)
}

import Foundation
struct GameLogic {
    private var gameWinPossibilities = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    internal var isCurrentPlayerX = true
    internal var isGameComplted = false
    var delegate: GameBoardResultDelegate?
    internal var playerX = Player()
    internal var playerO = Player()
    
    // MARK: - Player Play
    // Select player positions in Game Board
    mutating func playerSelectedPosition(selectedPosition: Int) {
        if isCurrentPlayerX {
            playerX.selectdPosition(selectedPosition)
        } else {
            playerO.selectdPosition(selectedPosition)
        }
        checkGameResult()
    }
    
    // Current Player
    func getCurrentPlayerString() -> String {
        return isCurrentPlayerX ? PLAYER_X : PLAYER_O
    }
    
    func playerHasToMove() -> String {
        return "Player-\(getCurrentPlayerString()) Turn ✅"
    }
    
    // Check player selected postion is valid or not
    internal mutating func isValidPosition(validatePosition: Int) -> Bool {
        let totalGameMoves: Set = Set(playerX.moves + playerO.moves)
        if totalGameMoves.contains(validatePosition) {
            return false
        }
        return true
    }
    
    // MARK: - Game Winning
    private mutating func checkGameResult() {
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
    
    // Check player was WON Game
    internal mutating func isWinner(player: Player) {
        for win in gameWinPossibilities {
            let playerMoves: Set = Set(player.moves)
            let winningArray: Set = Set(win)
            if(winningArray.isSubset(of: playerMoves)) {
                isGameComplted = true
                break
            }
        }
    }
    
    private func playerWon() -> String {
        return "Player-\(getCurrentPlayerString()) has WON 👍"
    }
    
    // Check Game has win positions
    private mutating func isGameHasWinningPosiotions() -> Bool {
        return (playerX.moves.count + playerO.moves.count) >= GAME_REACHED_WINNING_POSSIBILITIES
    }
    
    // MARK: - Game Draw
    // Players are reached maximum game moves and game is available for draw
    internal mutating func isAvailableGameDraw() -> Bool {
        return (playerX.moves.count + playerO.moves.count) == GAME_REACHED_DRAWN_POSSIBILITIES
    }
    
    // MARK: - Restart Game
    mutating func resetGameBoard() {
        playerX.moves.removeAll()
        playerO.moves.removeAll()
        isCurrentPlayerX = true
        isGameComplted = false
    }
}
