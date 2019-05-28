//
//  Game.swift
//  TicTacToe
//

import Foundation

protocol BoardSlotDelegate {
    func sendSlotpositions(position: Int, player: String)
}

struct GameLogic {
    var winArr = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    var positionSlots = [1,2,3,4,5,6,7,8,9]
    var delegate: BoardSlotDelegate?
    
    let minimumBoxPosition = 1
    let maximumBoxPosition = 8
    var activePlayer = false
    
    var playerOne = Player()
    var playerTwo = Player()
    
    mutating func isInitialStepMovedByPlayerOne() {
        activePlayer = true
    }
    
    // Start Game
    mutating func startGame() -> String {
        for _ in minimumBoxPosition...maximumBoxPosition {
            let playerRandomSlot: Int! = positionSlots.randomItem()
            if activePlayer {
                playerOne.addSlot(playerRandomSlot)
                delegate?.sendSlotpositions(position: playerRandomSlot, player: PLAYER_ONE)
                if ((playerOne.slotsCount() >= MINIMUM_POSSIBILITY_STEPS) && (isWinner(player: playerOne))) {
                    return PLAYER_ONE_WON
                }
            } else {
                playerTwo.addSlot(playerRandomSlot)
                delegate?.sendSlotpositions(position: playerRandomSlot, player: PLAYER_TWO)
                if ((playerTwo.slotsCount() >= MINIMUM_POSSIBILITY_STEPS) && (isWinner(player: playerTwo))) {
                    return PLAYER_TWO_WON
                }
            }
            
            if let index = positionSlots.index(of: playerRandomSlot) {
                positionSlots.remove(at: index)
            }
            activePlayer.toggle()
        }
        return MATCH_DRAWN
    }
    
    // check player was WON Game
    mutating func isWinner(player: Player) -> Bool {
        var matched = false
        for win in winArr {
            let playerMoves: Set = Set(player.moves)
            let winningArray: Set = Set(win)
            if(winningArray.isSubset(of: playerMoves)) {
                matched = true
                break
            }
        }
        return matched
    }
}