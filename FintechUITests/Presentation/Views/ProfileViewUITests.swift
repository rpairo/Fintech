//
//  ProfileViewUITests.swift
//  FintechUITests
//
//  Created by Raúl Pera Pairó on 25/1/21.
//

import XCTest
@testable import Fintech

class ProfileViewUITests: XCTestCase {
    // MARK: Lifecycle
    override func setUp() {
        continueAfterFailure = true
    }

    // MARK: Functionality
    func testTapProfileButton() {
        let app = XCUIApplication()
        app.launch()

        // Navigate to Profile view
        app.tabBars["Tab Bar"].buttons["Profile"].tap()

        // Check title of navigation
        XCTAssertTrue(app.navigationBars.staticTexts["Profile"].exists)
    }
}
