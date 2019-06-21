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
		app.launch()
    }

	var app: XCUIApplication {
		return XCUIApplication()
	}
	
	
	
	
	func testNextSol() {
		let nextButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
	
		let solLabel = app.otherElements["Sol 15"]
		
		XCTAssert(solLabel.waitForExistence(timeout: 2))
		nextButton.tap()
		
		let newSolLabel = app.otherElements["Sol 16"]
		XCTAssert(newSolLabel.waitForExistence(timeout: 2))
	
	
	}
	
	func testPreviouseSol() {
		let nextButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
		let solLabel = app.otherElements["Sol 15"]
		
		XCTAssert(solLabel.waitForExistence(timeout: 2))
		nextButton.tap()
		
		let newSolLabel = app.otherElements["Sol 16"]
		XCTAssert(newSolLabel.waitForExistence(timeout: 2))
		
		let previousButton = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
		previousButton.tap()
		XCTAssert(solLabel.waitForExistence(timeout: 5))
		
	}
	
	func testPhotoCellId0() {
		let cell0 = app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 0"]
		cell0.tap()
		XCTAssert(app.otherElements["725"].waitForExistence(timeout: 2))
		
	}
	
	func testSwipeDownSelectCell22(){
		app.swipeUp()
		app.swipeUp()
		XCTAssert(app.otherElements["Sol 15"].waitForExistence(timeout: 1))
		
		//PhotoCell id: 22
		let cell22 = app.collectionViews["MyPhotosCollection"].cells["PhotoCell id: 22"]
		cell22.tap()
		XCTAssert(app.otherElements["58811"].waitForExistence(timeout: 1))
		
	}
	
	
}
