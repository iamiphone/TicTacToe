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
    }
    
    func testPlayerCannotPlayOnPlayedPosition() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        
        // Player X has 3 moves, Player O has 2 moves
        XCTAssertTrue(game.playerX.moves.count == 3)
        XCTAssertTrue(game.playerO.moves.count == 2)
    }
    
    func testGameWonByPlayerX() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        
        // Player O has to move
        game.turnMove(selectedPosition: 9)
        
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        
        // Player O has to move
        game.turnMove(selectedPosition: 7)
        
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        
        // Check Player X WON
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }

    func testPlayerWinGameAtHorizontalTopRow() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        // Check Player X WON at Top Row
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testPlayerWinGameAtHorizontalCenterRow() {

        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        // Player X has to move
        game.turnMove(selectedPosition: 2)
        // Player O has to move
        game.turnMove(selectedPosition: 6)
        
        // Check Player O WON at Center ROW
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
    }
    func testPlayerWinGameAtHorizontalBottomRow() {
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Player X WON at Bottom Row
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testPlayerWinGameAtVerticallyLeftColumn() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        // Player X has to move
        game.turnMove(selectedPosition: 4)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Player X WON in Left Column
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }

    func testPlayerWinGameAtVerticallyCenterColumn() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        // Player O has to move
        game.turnMove(selectedPosition: 8)
        
        // Check Player O WON in Center Column
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
    }

    func testPlayerWinGameAtVerticallyRightColumn() {
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        // Player X has to move
        game.turnMove(selectedPosition: 3)
        
        // Check Player X WON in Right Column
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }

    func testPlayerWinGameAtDiagonallyLeftToRight() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        // Player O has to move
        game.turnMove(selectedPosition: 6)
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        
        // Check Player X WON in Left to Right Diagonal
        game.isWinner(player: game.playerX)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testPlayerWinGameAtDiagonallyRightToLeft() {
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        // Player X has to move
        game.turnMove(selectedPosition: 9)
        // Player O has to move
        game.turnMove(selectedPosition: 5)
        // Player X has to move
        game.turnMove(selectedPosition: 4)
        // Player O has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Player O WON in Right to Left Diagonal
        game.isWinner(player: game.playerO)
        XCTAssertTrue(game.isGameComplted)
    }
    
    func testMatchDraw() {
        // Check Game Draw
        // Player X has to move
        game.turnMove(selectedPosition: 5)
        // Player O has to move
        game.turnMove(selectedPosition: 3)
        // Player X has to move
        game.turnMove(selectedPosition: 8)
        // Player O has to move
        game.turnMove(selectedPosition: 2)
        // Player X has to move
        game.turnMove(selectedPosition: 1)
        // Player O has to move
        game.turnMove(selectedPosition: 9)
        // Player X has to move
        game.turnMove(selectedPosition: 6)
        // Player O has to move
        game.turnMove(selectedPosition: 4)
        
        // Check Game has still moves (not for Draw)
        XCTAssertFalse(game.isAvailableGameDraw())
        
        // Player X has to move
        game.turnMove(selectedPosition: 7)
        
        // Check Game available for Draw
        XCTAssertTrue(game.isAvailableGameDraw())
    }
}
