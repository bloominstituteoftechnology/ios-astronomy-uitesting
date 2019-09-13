//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Marlon Raskin on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

	var app: XCUIApplication!

    override func setUp() {
		super.setUp()
		print("Starting a new UI test")

        continueAfterFailure = false
		app = XCUIApplication()
		app.launchArguments = ["UITesting"]
        app.launch()
    }

    

	func solNavTitleWith(solNumber: Int) -> XCUIElement {
		let navTitle = app.navigationBars["Sol \(solNumber)"]
		XCTAssertTrue(navTitle.exists)
		return navTitle
    }

	var goToNextSolButton: XCUIElement {
		let nextButton = app.buttons[">"]
		XCTAssertTrue(nextButton.exists)
		XCTAssertTrue(nextButton.isEnabled)
		return nextButton
	}

	func testSolNavigationControllerTitleStartsWithSol15() {
		XCTAssertTrue(solNavTitleWith(solNumber: 15).exists)
	}

	func testGoToNextSolButtonIncrementsByOne() {
		solNavTitleWith(solNumber: 15).buttons[">"].tap()
//		goToNextSolButton.tap()
		XCTAssertTrue(solNavTitleWith(solNumber: 16).exists)
	}

	func testSolNavigationButtonDecrementsByOne() {
		solNavTitleWith(solNumber: 15).buttons["<"].tap()
		XCTAssertTrue(solNavTitleWith(solNumber: 14).exists)
	}


}
