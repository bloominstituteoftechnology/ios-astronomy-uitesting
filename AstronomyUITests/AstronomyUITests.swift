//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Hector Steven on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
		XCUIApplication().launch()
		let app = XCUIApplication()
		app.launchArguments = ["UITesting"]
    }

	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	
	
	
	func testNextSol() {
		let nextButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
	
		let solLabel = app.otherElements["Sol 1"]
		
		XCTAssert(solLabel.waitForExistence(timeout: 2))
		nextButton.tap()
		
		let newSolLabel = app.otherElements["Sol 2"]
		XCTAssert(newSolLabel.waitForExistence(timeout: 2))
	}
	
	func testPreviouseSol() {
		let nextButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
		let solLabel = app.otherElements["Sol 1"]
		
		XCTAssert(solLabel.waitForExistence(timeout: 2))
		nextButton.tap()
		
		let newSolLabel = app.otherElements["Sol 2"]
		XCTAssert(newSolLabel.waitForExistence(timeout: 2))
		
		let previousButton = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
		previousButton.tap()
		XCTAssert(app.otherElements["Sol 1"].waitForExistence(timeout: 5))
		
	}
	

}
