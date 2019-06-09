//
//  TicTacToeTests.swift
//  TicTacToeTests
//

import XCTest

class TicTacToeTests: XCTestCase {
    var game = GameLogic()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlayerXAlwaysGoesFirst() {
        // Move initial selecton
        XCTAssertEqual(game.getCurrentPlayerString(), PLAYER_X)
        XCTAssertNotEqual(game.getCurrentPlayerString(), PLAYER_O)
        game.turnMove(selectedPosition: 1)
        // check imitial move selected by Player X (has move count 1), Player O has '0' count
        XCTAssertEqual(game.playerX.slotsCount(), 1)
        XCTAssertEqual(game.playerO.slotsCount(), 0)
    }
    
    func testPlayerCannotPlayOnPlayedPosition() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        
        // Player X has 3 moves, Player O has 2 moves
        XCTAssertTrue(game.playerX.slotsCount() == 3)
        XCTAssertTrue(game.playerO.slotsCount() == 2)
    }
    
    func testGameWonByPlayerX() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        game.isCurrentPlayerX.toggle()
        
        // Player O has to move
        game.turnMove(selectedPosition: 7)
        game.isCurrentPlayerX.toggle()
        
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        
        // Check Player O Loss
        game.isWinner(player: game.playerO)
        XCTAssertFalse(game.isGameComplted)
        
        // Check Player X WON
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testHorizontallyPlayerGameWinningPossibilities() {
        // Check Player WON in FIRST ROW
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        // Check Player X WON in FIRST ROW
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
        
        // Reset Game
        game.reset()
        
        // Check Player WON in Second ROW
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 6)
        
        // Check Player O WON in SECOND ROW
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
        
        // Reset Game
        game.reset()
        
        // Check Player WON in THIRD ROW
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Player X WON in THIRD ROW
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testVertillyPlayerGameWinning() {
        // Check Player WON in Left Column
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Player X WON in Left Column
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
        
        // Reset Game
        game.reset()
        
        // Check Player WON in Center Column
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 8)
        game.isCurrentPlayerX.toggle()
        
        // Check Player O WON in Center Column
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
        
        // Reset Game
        game.reset()
        
        // Check Player WON in Right Column
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        
        // Check Player X WON in Right Column
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testDiagonallyPlayerGameWinning() {
        // Check Player WON in Left to Right Diagonal
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 6)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        
        // Check Player X WON in Left to Right Diagonal
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
        
        // Reset Game
        game.reset()
        
        // Check Player WON in Right to Left Diagonal
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 7)
        game.isCurrentPlayerX.toggle()
        
        // Check Player O WON in Right to Left Diagonal
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testMatchDraw() {
        // Check Game Draw
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 9)
        game.isCurrentPlayerX.toggle()
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        game.isCurrentPlayerX.toggle()
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        game.isCurrentPlayerX.toggle()
        
        // Check Game has still moves (not for Draw)
        XCTAssertFalse(game.isAvailableGameDraw())
        
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        game.isCurrentPlayerX.toggle()
        
        // Check Game available for Draw
        XCTAssertTrue(game.isAvailableGameDraw())
    }
}
