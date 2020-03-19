//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by scott harris on 3/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    let app = XCUIApplication()
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // UI tests must launch the application that they test.
        app.launchArguments = ["UITesting"]
        app.launch()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testSavingAPhoto() {
        let cellToTap = app.cells["Cell0"]
        cellToTap.tap()
        XCTAssertNotNil(app.images["PhotoDetailViewController.ImageView"])
        let button = app.buttons["PhotoDetailViewController.SaveButton"]
        button.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
    func testChangingSolsForward() {
        let nextSol = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSol.tap()
        XCTAssertGreaterThan(app.cells.count, 3)
    }
    
    func testChangingSolsBackwards() {
        let prevSol = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        prevSol.tap()
        XCTAssertGreaterThan(app.cells.count, 3)
        
    }
    
    func testGoToDetailView() {
        let cellToTap = app.cells["Cell3"]
        cellToTap.tap()
        XCTAssertNotNil(app.images["PhotoDetailViewController.ImageView"])
        XCTAssertNotNil(app.staticTexts["DetailLabel"].label)
        XCTAssertNotNil(app.staticTexts["CameraLabel"].label)
    }
    
    func testClickOKAfterPhotoSave() {
        let cellToTap = app.cells["Cell0"]
        cellToTap.tap()
        XCTAssertNotNil(app.images["PhotoDetailViewController.ImageView"])
        let button = app.buttons["PhotoDetailViewController.SaveButton"]
        button.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
        app.alerts.buttons.firstMatch.tap()
        XCTAssertFalse(app.alerts.buttons.firstMatch.exists)
    }
    
}
