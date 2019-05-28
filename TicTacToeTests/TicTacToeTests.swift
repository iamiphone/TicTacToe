//
//  TicTacToeTests.swift
//  TicTacToeTests
//

import XCTest
@testable import TicTacToe

class TicTacToeTests: XCTestCase {
    var game = GameLogic()
    var playerOne = Player()
    var playerTwo = Player()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCreatePlayerOne() {
        XCTAssertNotNil(playerOne)
    }
    
    func testCreatePlayerTwo() {
        XCTAssertNotNil(playerTwo)
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
        playerOne.addSlot(1)
        playerOne.addSlot(2)
        playerOne.addSlot(3)
        XCTAssertTrue(game.isWinner(player: playerOne))
    }
    
    func testWinningPossibilitiesOfHorizontalRow2() {
        playerOne.addSlot(4)
        playerOne.addSlot(5)
        playerOne.addSlot(6)
        XCTAssertTrue(game.isWinner(player: playerOne))
    }
    
    func testWinningPossibilitiesOfHorizontalRow3() {
        playerTwo.addSlot(7)
        playerTwo.addSlot(8)
        playerTwo.addSlot(9)
        XCTAssertTrue(game.isWinner(player: playerTwo))
    }
    
    func testWinningPossibilitiesOfVerticalRow1() {
        playerOne.addSlot(1)
        playerOne.addSlot(4)
        playerOne.addSlot(7)
        XCTAssertTrue(game.isWinner(player: playerOne))
    }
    
    func testWinningPossibilitiesOfVerticalRow2() {
        playerOne.addSlot(2)
        playerOne.addSlot(5)
        playerOne.addSlot(8)
        XCTAssertTrue(game.isWinner(player: playerOne))
    }
    
    func testWinningPossibilitiesOfVerticalRow3() {
        playerTwo.addSlot(3)
        playerTwo.addSlot(6)
        playerTwo.addSlot(9)
        XCTAssertTrue(game.isWinner(player: playerTwo))
    }
    
    func testWinningPossibilitiesOfDiagonalRow1() {
        playerOne.addSlot(1)
        playerOne.addSlot(5)
        playerOne.addSlot(9)
        XCTAssertTrue(game.isWinner(player: playerOne))
    }
    
    func testWinningPossibilitiesOfDiagonalRow2() {
        playerTwo.addSlot(3)
        playerTwo.addSlot(5)
        playerTwo.addSlot(7)
        XCTAssertTrue(game.isWinner(player: playerTwo))
    }
    
    func test_MatchDrawn() {
        playerOne.addSlot(6)
        playerTwo.addSlot(7)
        playerOne.addSlot(2)
        playerTwo.addSlot(3)
        playerOne.addSlot(5)
        playerTwo.addSlot(4)
        playerOne.addSlot(1)
        playerTwo.addSlot(8)
        playerOne.addSlot(9)
        XCTAssertFalse(game.isWinner(player: playerTwo))
    }
    
    func test_CheckPlayerSlotsCount() {
        playerOne.addSlot(6)
        playerTwo.addSlot(7)
        playerOne.addSlot(2)
        playerTwo.addSlot(3)
        XCTAssertEqual(2,playerOne.slotsCount())
        XCTAssertEqual(2,playerTwo.slotsCount())
    }
    
    func test_ResetBothPlayerMoves() {
        playerOne.addSlot(6)
        playerTwo.addSlot(7)
        playerOne.addSlot(2)
        playerTwo.addSlot(3)
        playerOne.reset()
        playerTwo.reset()
        XCTAssertEqual(0,playerOne.slotsCount())
        XCTAssertEqual(0,playerTwo.slotsCount())
    }
}
