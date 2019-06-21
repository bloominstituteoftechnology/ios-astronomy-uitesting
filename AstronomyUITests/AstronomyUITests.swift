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
		let app = XCUIApplication()
		app.launchArguments = ["UITesting"]
		app.launch()
    }

	func testNextSol() {
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 2))
		nextSolButton.tap()

		XCTAssert(title["Sol 16"].waitForExistence(timeout: 2))
	}
	
	func testPreviouseSol() {
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 2))
		nextSolButton.tap()

		XCTAssert(title["Sol 16"].waitForExistence(timeout: 2))
		previousSolButton.tap()
		
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 5))
	}
	
	func testPhotoCellId0() {
		cell0.tap()
		XCTAssert(title["725"].waitForExistence(timeout: 2))
	}
	
	func testSwipeDownSelectCell22(){
		app.swipeUp()
		app.swipeUp()
		XCTAssert(title["Sol 15"].waitForExistence(timeout: 1))
		
		cell22.tap()
		XCTAssert(title["58811"].waitForExistence(timeout: 1))
	}
	
	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	var nextSolButton: XCUIElement {
		return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
	}
	
	var previousSolButton: XCUIElement {
		return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
	}
	
	
	var title: XCUIElementQuery {
		return app.otherElements
	}
	
	var cell22: XCUIElement {
		return self.app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 22"]
	}
	
	var cell0: XCUIElement {
		return app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 0"]
	}
}
