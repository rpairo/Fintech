//
//  DashboardViewUITests.swift
//  FintechUITests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class DashboardViewUITests: XCTestCase {
    // MARK: Lifecycle
    override func setUp() {
        continueAfterFailure = true
    }

    // MARK: Functionality
    func testEnoughTextViews() {
        let app = XCUIApplication()
        app.launch()

        // Check title of navigation
        XCTAssertTrue(app.navigationBars.staticTexts["Dashboard"].exists)

        // Check main text views
        XCTAssertTrue(app.staticTexts["scoreTopText"].exists)
        XCTAssertTrue(app.staticTexts["scoreMiddleText"].exists)
        XCTAssertTrue(app.staticTexts["scoreBottomText"].exists)
    }
}
