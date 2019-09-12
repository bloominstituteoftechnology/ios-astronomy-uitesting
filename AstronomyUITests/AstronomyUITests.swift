//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jeffrey Santana on 9/12/19.
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

    override func tearDown() {
		
    }

	func testRecording() {
		
//		let sol1NavigationBar = XCUIApplication().navigationBars["Sol 1"]
//		sol1NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		sol1NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//	
		
	}
	
	var previousSolBtn: XCUIElement {
		let button = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
		XCTAssertTrue(button.exists)
		return button
	}
	
	var nextSolBtn: XCUIElement {
		let button = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
		XCTAssertTrue(button.exists)
		return button
	}
	
	func testNextSol() {
		nextSolBtn.tap()
		XCTAssertTrue(app.navigationBars["Sol 16"].exists)
	}
	
	func testPreviousSol() {
		nextSolBtn.tap()
		previousSolBtn.tap()
		XCTAssertTrue(app.navigationBars["Sol 15"].exists)
	}

}
