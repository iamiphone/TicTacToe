//
//  Game.swift
//  TicTacToe
//

import Foundation

protocol PlayerSelectedSlotDelegate {
    func selectedSlotPositionByPlayer(position: Int, player: String)
}

struct GameLogic {
    var winArr = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    var positionSlots = [1,2,3,4,5,6,7,8,9]
    var delegate: PlayerSelectedSlotDelegate?
    
    let minimumBoxPosition = 1
    let maximumBoxPosition = 8
    var activePlayer = false
    var randomSelection = false
    
    var playerOne = Player()
    var playerTwo = Player()
    
    mutating func isInitialStepMovedByPlayerOne() {
        activePlayer = true
    }
    
    mutating func isSlotSelectByRandom() {
        randomSelection = true
    }
    
    // Start Game
    mutating func startGame() -> String {
        for index in minimumBoxPosition...maximumBoxPosition {
            let playerRandomSlot: Int! = (randomSelection) ? positionSlots.randomItem() : index
            if activePlayer {
                playerOne.addSlot(playerRandomSlot)
                delegate?.selectedSlotPositionByPlayer(position: playerRandomSlot, player: PLAYER_ONE)
                if ((playerOne.slotsCount() >= MINIMUM_POSSIBILITY_STEPS) && (isWinner(player: playerOne))) {
                    return PLAYER_ONE_WON
                }
            } else {
                playerTwo.addSlot(playerRandomSlot)
                delegate?.selectedSlotPositionByPlayer(position: playerRandomSlot, player: PLAYER_TWO)
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
    
    // Check player was WON Game
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
    
    // Remove all selected player slots
    mutating func reset() {
        playerOne.moves.removeAll()
        playerTwo.moves.removeAll()
    }
}
