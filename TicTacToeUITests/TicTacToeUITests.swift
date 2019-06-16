//
//  TicTacToeUITests.swift
//  TicTacToeUITests
//

import XCTest

class TicTacToeUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testPlayerXAlwaysGoesFirst() {
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X Turn ✅")
        app.buttons["topLeft"].tap()
        XCTAssertEqual(app.buttons["topLeft"].label, "X")
    }
    
    func testPlayerSelectedInValidPosition() {
        let playerSelectPosition: XCUIElement = app.buttons["topLeft"]
        playerSelectPosition.tap()
        playerSelectPosition.tap()
        let alert: XCUIElement = app.alerts["Invalid Selection"].buttons["OK"]
        XCTAssertTrue(alert.isEnabled)
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-O Turn ✅")
        app.buttons["centerCenter"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X Turn ✅")
    }
    
    func testpressStartButton() {
        app.buttons["bottomRight"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        app.buttons["centerRight"].tap()
        // Start Game
        app.buttons["startButton"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X Turn ✅")
    }
    
    func testPlayerWinGameAtHorizontalTopRow() {
        app.buttons["topLeft"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testPlayerWinGameAtHorizontalCenterRow() {
        app.buttons["bottomRight"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        app.buttons["centerRight"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerLeft"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-O has WON 👍")
    }
    
    func testPlayerWinGameAtHorizontalBottomRow() {
        app.buttons["bottomLeft"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["bottomCenter"].tap()
        app.buttons["centerRight"].tap()
        app.buttons["bottomRight"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testPlayerWinGameAtVerticallyLeftColumn() {
        app.buttons["topLeft"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["bottomCenter"].tap()
        app.buttons["bottomLeft"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testPlayerWinGameAtVerticallyCenterColumn() {
        app.buttons["bottomRight"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["bottomCenter"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-O has WON 👍")
    }
    
    func testPlayerWinGameAtVerticallyRightColumn() {
        app.buttons["bottomRight"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerRight"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testPlayerWinGameAtDiagonallyLeftToRight() {
        app.buttons["topLeft"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["bottomRight"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testPlayerWinGameAtDiagonallyRightToLeft() {
        app.buttons["topRight"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["centerCenter"].tap()
        app.buttons["topLeft"].tap()
        app.buttons["bottomLeft"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Player-X has WON 👍")
    }
    
    func testMatchDraw() {
        app.buttons["centerCenter"].tap()
        app.buttons["topRight"].tap()
        app.buttons["bottomCenter"].tap()
        app.buttons["topCenter"].tap()
        app.buttons["topLeft"].tap()
        app.buttons["bottomRight"].tap()
        app.buttons["centerRight"].tap()
        app.buttons["centerLeft"].tap()
        app.buttons["bottomLeft"].tap()
        XCTAssertEqual(app.staticTexts["resultLabel"].label, "Match Draw 🤝")
    }
}
