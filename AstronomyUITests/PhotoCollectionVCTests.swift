//
//  PhotoCollectionVCTests.swift
//  AstronomyUITests
//
//  Created by Jeffrey Santana on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class PhotoCollectionVCTests: XCTestCase {
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
		app.launch()
    }

	func testRecording() {
		
//		let app = XCUIApplication()
//		let element = app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//		element.tap()
//		element.tap()
//		element/*@START_MENU_TOKEN@*/.swipeRight()/*[[".swipeDown()",".swipeRight()"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//		app.staticTexts["Taken by 5 on 8/6/12, 8:00 PM (Sol 1)"].tap()
//		app.staticTexts["Camera:"].tap()
//		app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		app.alerts["“Astronomy” Would Like to Access Your Photos"].buttons["OK"].tap()
//		
//		
////		let app = XCUIApplication()
//		app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
//		app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//		app.alerts["Photo Saved!"].buttons["Okay"].tap()
		
		
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
