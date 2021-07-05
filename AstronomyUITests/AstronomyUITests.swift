//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jerry haaser on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    let app: XCUIApplication = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        
        app.launch()
    }
    func testGoToPreviousSol() {
      
        let previousSolButton = app.buttons["PhotosCollectionView.previousSolButton"]
        previousSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testGoToNextSol() {
        
        let nextSolButton = app.buttons["PhotosCollectionView.nextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testImageLoad() {
       
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailView.saveButton"].exists)
    }
    
    func testImageSave() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.tap()
        app.buttons["PhotoDetailView.saveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }

}
