//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lisa Sampson on 6/20/19.
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
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var collectionView: XCUIElementQuery {
        return app.collectionViews
    }

    // MARK: - UI Tests
    func testTappingPreviousSol() {
        let previousSolButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        previousSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testTappingNextSol() {
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testTappingCollectionCell() {
        let cell = collectionView.cells.element(boundBy: 0)
        cell.tap()
        XCTAssert(app.staticTexts["Front Hazard Avoidance Camera"].exists)
    }
    
    func testTappingSaveButton() {
        let cell = collectionView.cells.element(boundBy: 0)
        cell.tap()
        
        let save = app.buttons["PhotoDetailViewController.SaveButton"]
        save.tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        
        app.alerts.buttons["Okay"].tap()
        XCTAssert(app.staticTexts["Front Hazard Avoidance Camera"].exists)
    }
    
    func testScroll() {
        collectionView.element.swipeUp()
        collectionView.element.swipeDown()
    }
    
    func testBackButton() {
        let cell = collectionView.cells.element(boundBy: 0)
        cell.tap()
        let back = app.buttons["Sol 15"]
        back.tap()
        XCTAssert(app.navigationBars["Sol 15"].exists)
    }

}
