//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_204 on 12/12/19.
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



    func testViewNextSolImages() {
        let app = XCUIApplication()
        let nextButton = app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"]
        XCTAssert(nextButton.exists)
        nextButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
    }
    
    func testViewPreviousSolImages() {
        let app = XCUIApplication()
        let previousButton = app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.PreviousSolButton"]
        XCTAssert(previousButton.exists)
        previousButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 14"].exists)
        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
    }
    
    func testSelectingPhoto() {
        let app = XCUIApplication()
        
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element
        
        XCTAssertTrue(cell.exists)
        cell.tap()
        XCTAssert(app.navigationBars["Title"].exists)
    }
    
    
    func testSavingPhoto() {
        //PhotoDetailViewController.SaveButton
        
        let app = XCUIApplication()
        
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element
        
        XCTAssertTrue(cell.exists)
        cell.tap()
        XCTAssert(app.navigationBars["Title"].exists)
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssertTrue(saveButton.exists)
        saveButton.tap()
        
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
}
