//
//  TicTacToeTests.swift
//  TicTacToeTests
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    var game = GameLogic()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreatePlayerOne() {
        XCTAssertNotNil(game.playerOne)
    }
    
    func testCreatePlayerTwo() {
        XCTAssertNotNil(game.playerTwo)
    }
    
    func testCreateGameLogic() {
        XCTAssertNotNil(game)
    }
    
    func testBoardSlots() {
        XCTAssertEqual(9, game.positionSlots.count)
    }
    
    func testInitialMovePlayedByPlayerOne() {
        XCTAssertFalse(game.activePlayer)
        game.isInitialStepMovedByPlayerOne()
        XCTAssertTrue(game.activePlayer)
    }
    
    func testWinningPossibilitiesOfHorizontalRow1() {
        game.playerOne.addSlot(1)
        game.playerOne.addSlot(2)
        game.playerOne.addSlot(3)
        XCTAssertTrue(game.isWinner(player: game.playerOne))
    }
    
    func testWinningPossibilitiesOfHorizontalRow2() {
        game.playerOne.addSlot(4)
        game.playerOne.addSlot(5)
        game.playerOne.addSlot(6)
        XCTAssertTrue(game.isWinner(player: game.playerOne))
    }
    
    func testWinningPossibilitiesOfHorizontalRow3() {
        game.playerTwo.addSlot(7)
        game.playerTwo.addSlot(8)
        game.playerTwo.addSlot(9)
        XCTAssertTrue(game.isWinner(player: game.playerTwo))
    }
    
    func testWinningPossibilitiesOfVerticalRow1() {
        game.playerOne.addSlot(1)
        game.playerOne.addSlot(4)
        game.playerOne.addSlot(7)
        XCTAssertTrue(game.isWinner(player: game.playerOne))
    }
    
    func testWinningPossibilitiesOfVerticalRow2() {
        game.playerOne.addSlot(2)
        game.playerOne.addSlot(5)
        game.playerOne.addSlot(8)
        XCTAssertTrue(game.isWinner(player: game.playerOne))
    }
    
    func testWinningPossibilitiesOfVerticalRow3() {
        game.playerTwo.addSlot(3)
        game.playerTwo.addSlot(6)
        game.playerTwo.addSlot(9)
        XCTAssertTrue(game.isWinner(player: game.playerTwo))
    }
    
    func testWinningPossibilitiesOfDiagonalRow1() {
        game.playerOne.addSlot(1)
        game.playerOne.addSlot(5)
        game.playerOne.addSlot(9)
        XCTAssertTrue(game.isWinner(player: game.playerOne))
    }
    
    func testWinningPossibilitiesOfDiagonalRow2() {
        game.playerTwo.addSlot(3)
        game.playerTwo.addSlot(5)
        game.playerTwo.addSlot(7)
        XCTAssertTrue(game.isWinner(player: game.playerTwo))
    }
    
    func test_MatchDrawn() {
        game.playerOne.addSlot(6)
        game.playerTwo.addSlot(7)
        game.playerOne.addSlot(2)
        game.playerTwo.addSlot(3)
        game.playerOne.addSlot(5)
        game.playerTwo.addSlot(4)
        game.playerOne.addSlot(1)
        game.playerTwo.addSlot(8)
        game.playerOne.addSlot(9)
        XCTAssertFalse(game.isWinner(player: game.playerTwo))
    }
    
    func test_CheckPlayerSlotsCount() {
        game.playerOne.addSlot(6)
        game.playerTwo.addSlot(7)
        game.playerOne.addSlot(2)
        game.playerTwo.addSlot(3)
        XCTAssertEqual(2,game.playerOne.slotsCount())
        XCTAssertEqual(2,game.playerTwo.slotsCount())
    }
    
    func test_ResetBothPlayerMoves() {
        game.playerOne.addSlot(6)
        game.playerTwo.addSlot(7)
        game.playerOne.addSlot(2)
        game.playerTwo.addSlot(3)
        game.reset()
        XCTAssertEqual(0,game.playerOne.slotsCount())
        XCTAssertEqual(0,game.playerTwo.slotsCount())
    }
    
    func testStartGameByRandomSlots() {
        game.isSlotSelectByRandom()
        let gameResult = game.startGame()
        switch gameResult {
        case PLAYER_ONE_WON:
            XCTAssertEqual(gameResult, PLAYER_ONE_WON)
        case PLAYER_TWO_WON:
            XCTAssertEqual(gameResult, PLAYER_TWO_WON)
        default:
            XCTAssertEqual(gameResult, MATCH_DRAWN)
        }
    }
    
    func testPlyerOneWon() {
        game.isInitialStepMovedByPlayerOne()
        let gameResult = game.startGame()
        XCTAssertEqual(gameResult, PLAYER_ONE_WON)
    }
    
    func testPlyerTwoWon() {
        let gameResult = game.startGame()
        XCTAssertEqual(gameResult, PLAYER_TWO_WON)
    }
}
