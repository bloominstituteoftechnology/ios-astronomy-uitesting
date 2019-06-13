//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Michael Redig on 6/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
	var app: XCUIApplication {
		return XCUIApplication()
	}

	var nextButton: XCUIElement {
		return app/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
	}

	var previousButton: XCUIElement {
		return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
	}

	func tapElement(element: XCUIElement) {
		XCTAssertTrue(element.exists)
		XCTAssertTrue(element.isHittable)
		element.tap()
	}

	func waitForExists(element: XCUIElement, action: () -> Void = { }) {
		let exists = NSPredicate(format: "exists == true")
		expectation(for: exists, evaluatedWith: element, handler: nil)
		action()
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertTrue(element.exists)
	}

	func waitForHittable(element: XCUIElement, action: () -> Void = { }) {
		let exists = NSPredicate(format: "isHittable == true")
		expectation(for: exists, evaluatedWith: element, handler: nil)
		action()
		waitForExpectations(timeout: 5, handler: nil)
		XCTAssertTrue(element.exists)
	}

	override func setUp() {
		// Put setup code here. This method is called before the invocation of each test method in the class.

		// In UI tests it is usually best to stop immediately when a failure occurs.
		continueAfterFailure = false

		// UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
		let app = XCUIApplication()
		app.launchArguments = ["UITesting"]
		app.launch()


		// In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
	}

	override func tearDown() {
		// Put teardown code here. This method is called after the invocation of each test method in the class.
	}

	func testNavigatingSols() {
		// not a particular cell, just whatever cell currently resides in the first position in the collection view - this can change
		let firstCell = app.cells["PhotosCollectionVC.Image[0, 0]"]

		waitForExists(element: app.navigationBars["Sol 16"]) {
			tapElement(element: nextButton)
		}
		XCTAssertTrue(firstCell.isHittable)

		tapElement(element: nextButton)
		XCTAssertTrue(app.navigationBars["Sol 16"].exists)
		XCTAssertTrue(firstCell.isHittable)

		waitForExists(element: app.navigationBars["Sol 15"]) {
			tapElement(element: previousButton)
		}
		XCTAssertTrue(firstCell.isHittable)

		waitForExists(element: app.navigationBars["Sol 14"]) {
			tapElement(element: previousButton)
		}
		XCTAssertTrue(firstCell.isHittable)

		tapElement(element: previousButton)
		XCTAssertTrue(app.navigationBars["Sol 14"].exists)
		XCTAssertTrue(firstCell.isHittable)
	}

	func testOpeningImage() {
		waitForExists(element: app.navigationBars["Title"]) {
			app.cells["PhotosCollectionVC.Image[0, 0]"].tap()
		}

		XCTAssertFalse(app.staticTexts["PhotoDetailVC.PhotoInfo"].label.contains("<Rover>"))
		XCTAssertFalse(app.staticTexts["PhotoDetailVC.CameraInfo"].label.contains("Label"))

		XCTAssertTrue(app.buttons["PhotoDetailViewController.SaveButton"].isHittable)

		app.navigationBars["Title"].buttons["Sol 15"].tap()
		XCTAssertTrue(app.navigationBars["Sol 15"].exists)

	}

	func testSavingImage() {

		waitForExists(element: app.navigationBars["Title"]) {
			app.cells["PhotosCollectionVC.Image[0, 0]"].tap()
		}

		let saveButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
		saveButton.tap()

		// wait to see if springboard permissions launch
		sleep(5)
		let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")
		let allowButton = springboard.buttons["OK"]

		if allowButton.exists {
			waitForHittable(element: saveButton) {
				allowButton.tap()
			}
		} else {
			let photoSavedAlert = app.alerts["Photo Saved!"]
			waitForExists(element: photoSavedAlert)
			XCTAssertTrue(photoSavedAlert.staticTexts["Photo Saved!"].exists)
			let okayButton = photoSavedAlert.buttons["Okay"]
			XCTAssertTrue(okayButton.exists)
			waitForHittable(element: saveButton) {
				okayButton.tap()
			}
		}

		saveButton.tap()

		let photoSavedAlert = app.alerts["Photo Saved!"]
		waitForExists(element: photoSavedAlert)
		XCTAssertTrue(photoSavedAlert.staticTexts["Photo Saved!"].exists)
		let okayButton = photoSavedAlert.buttons["Okay"]
		XCTAssertTrue(okayButton.exists)
		okayButton.tap()
	}

}
