//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Hayden Hastings on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        continueAfterFailure = false
        XCUIApplication().launch()
        app.launchArguments = ["UITesting"]
    }
    
    func testScroll() {
        
        let collectionView = XCUIApplication().otherElements.containing(.navigationBar, identifier:"Sol 1").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
        collectionView.swipeUp()
        collectionView.swipeDown()
        
    }
    
    func testBackToCollectionView() {
        
                let photos = app.collectionViews
        let selectedCell3 = photos.cells.element(boundBy: 2)
        selectedCell3.tap()
        let backButton = app.buttons["Sol 1"]
        backButton.tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
        
        
    }
    
    func testToSol2() {
        
        XCUIApplication().navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons[">"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        let photos = app.collectionViews
        let selectedCell3 = photos.cells.element(boundBy: 2)
        selectedCell3.tap()
        
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
        
        let backButton = app.buttons["Sol 2"]
        backButton.tap()
        XCTAssert(app.navigationBars["Sol 2"].exists)
        
    }
    
    func testSavePicture() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
    
    // MARK: - Actions
    let app = XCUIApplication()
    
    private var savePicturButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var statusLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
}
