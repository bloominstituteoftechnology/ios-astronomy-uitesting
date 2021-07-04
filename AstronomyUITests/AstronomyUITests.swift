//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jonathan Ferrer on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
    }



    func testSolDayChangeup() {
        let app = XCUIApplication()
        let nextButton = app.navigationBars["Sol 14"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(nextButton.exists)
        nextButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
        XCTAssertFalse(app.navigationBars["Sol 14"].exists)
    }


    func testSolDayChangeup1() {
        let app = XCUIApplication()
        let nextButton = app.navigationBars["Sol 14"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(nextButton.exists)
        nextButton.tap()
        let nextButtonAgain = app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(nextButtonAgain.exists)
        nextButtonAgain.tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
    }

    func testSolDayChangeDown() {
        let app = XCUIApplication()
        let nextButton = app.navigationBars["Sol 14"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nextButton.exists)
        nextButton.tap()
        let previousButton = app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(previousButton.exists)
        previousButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 14"].exists)
        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
    }

    func testSolDayChangeDown1() {
        let app = XCUIApplication()
        let nextButton = app.navigationBars["Sol 14"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nextButton.exists)
        nextButton.tap()
        let nextNextButton = app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(nextNextButton.exists)
        nextNextButton.tap()
        let previousButton = app.navigationBars["Sol 16"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(previousButton.exists)
        previousButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
        XCTAssertFalse(app.navigationBars["Sol 16"].exists)
    }

    func testInfoPassed() {

        let app = XCUIApplication()
        let nextButton = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        XCTAssert(nextButton.exists)
        nextButton.tap()
        let photoLabel = app.staticTexts["PhotoInfoLabel"]
        let cameraLabel = app.staticTexts["CameraLabel"]
        XCTAssert(photoLabel.exists)
        XCTAssert(cameraLabel.exists)
        XCTAssertTrue(photoLabel.label == "Taken by 5 on 8/19/12, 8:00 PM (Sol 14)")
        XCTAssertTrue(cameraLabel.label == "Front Hazard Avoidance Camera")
    }

    func testSavePhoto() {
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let saveButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(saveButton.exists)
        saveButton.tap()
        XCTAssertTrue(app.alerts["Photo Saved!"].exists)

    }

}
