//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Christopher Aronson on 6/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGoToNextSol() {
        
        let app = XCUIApplication()
        
        let nextButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        
        nextButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
        
    }
    
    func testGoToPrevious() {
        
        let app = XCUIApplication()
        
        let previousButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        
        previousButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testScroll() {
        
        let app = XCUIApplication()
        
        let collectionViews = app.collectionViews
        
        collectionViews.cells.element(boundBy: 0).swipeUp()
    }
    
    func testViewDetail() {
        
        let app = XCUIApplication()
        
        let collectionView = app.collectionViews
        let firstCell = collectionView.cells.element(boundBy: 0)
        
        firstCell.tap()
        XCTAssert(app.staticTexts["Front Hazard Avoidance Camera"].exists)
        
    }
    
    func testSaveImage() {
        
        let app = XCUIApplication()
        
        let collectionView = app.collectionViews
        let firstCell = collectionView.cells.element(boundBy: 0)
        
        firstCell.tap()
        
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        saveButton.tap()
        
        XCTAssert(app.alerts["Photo Saved!"].exists)
        
        app.alerts.buttons["Okay"].tap()
        XCTAssert(app.staticTexts["Front Hazard Avoidance Camera"].exists)
    }
    
    func testBackButton() {
        
        let app = XCUIApplication()
        
        let collectionView = app.collectionViews
        let firstCell = collectionView.cells.element(boundBy: 0)
        
        firstCell.tap()
        
        let button = app.buttons["Sol 15"]
        button.tap()
        
        XCTAssert(app.navigationBars["Sol 15"].exists)
    }

}
