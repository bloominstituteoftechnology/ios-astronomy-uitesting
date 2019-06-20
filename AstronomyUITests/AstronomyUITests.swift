//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kobe McKee on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
        print(app)
    }

    override func tearDown() {
    }

    
    func testGoToNextSol() {
        let app = XCUIApplication()

        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)

    }
    
    func testGoToPreviousSol() {
        let app = XCUIApplication()
        
        let previousSolButton = app/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        previousSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
        
        
    }
    
    
    
    func testLoadImage() {
        let app = XCUIApplication()

        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailViewController.SaveButton"].exists)

    }
    
    
    func testSaveImage() {
        let app = XCUIApplication()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.tap()
        
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
  
    }

}
