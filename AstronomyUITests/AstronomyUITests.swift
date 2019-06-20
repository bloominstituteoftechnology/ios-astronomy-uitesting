//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Mitchell Budge on 6/20/19.
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

    func testSavePhoto() {
        let app = XCUIApplication()
        let photos = app.collectionViews
        let selectedCell1 = photos.cells.element(boundBy: 0)
        selectedCell1.tap()
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        saveButton.tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
   
    func testViewAnotherSol() {
        let app = XCUIApplication()
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 2"].exists)
    }
    
    func testTapPhoto() {
        let app = XCUIApplication()
        let photos = app.collectionViews
        let selectedCell2 = photos.cells.element(boundBy: 1)
        selectedCell2.tap()
        XCTAssert(app.staticTexts["Mast Camera"].exists)
    }
    
    func testReturnToPhotos() {
        let app = XCUIApplication()
        let photos = app.collectionViews
        let selectedCell3 = photos.cells.element(boundBy: 2)
        selectedCell3.tap()
        let backButton = app.buttons["Sol 1"]
        backButton.tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
    }

    
    
}
