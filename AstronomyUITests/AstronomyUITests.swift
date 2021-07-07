//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dillon P on 11/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

     var app = XCUIApplication()
    
    override func setUp() {
        app.launchArguments.append("UITesting")
        
        continueAfterFailure = false
        app.launch()
    }
    
    func testRoverPhotoDetailView() {
        app.launch()
        
        let cell = app.collectionViews.cells.element(boundBy:0)
        XCTAssert(cell.exists)
        cell.tap()
    }
    
    func testSaveRoverPhoto() {
        app.launch()
        
        let cell = app.collectionViews.cells.element(boundBy:0)
        XCTAssert(cell.exists)
        cell.tap()
        
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssert(saveButton.exists)
        
        saveButton.tap()
    }
    
    func testGoToNextSol() {
        app.launch()
                
        let nextSol = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
        XCTAssert(nextSol.exists)
        nextSol.tap()
        
        let previousSol = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
        XCTAssert(previousSol.exists)
        previousSol.tap()
    }

    func testGoToBottomTapDetailAndBack() {
        app.launch()
        
        app.collectionViews.element.swipeUp()
        app.collectionViews.element.swipeUp()
        
        let cell = app.collectionViews.cells.element(boundBy: 0)
        XCTAssert(cell.exists)
        
        cell.tap()
        
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        XCTAssert(backButton.exists)
        
        backButton.tap()
        
        app.collectionViews.element.swipeDown()
        app.collectionViews.element.swipeDown()
    }
    
   
}
