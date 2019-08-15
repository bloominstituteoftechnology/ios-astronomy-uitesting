//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kat Milton on 8/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
    }
    
    func testGoToPreviousSol() {
        app = XCUIApplication()
        let previousSolButton = app.buttons["PhotosCollectionView.previousSolButton"]
        previousSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testGoToNextSol() {
        app = XCUIApplication()
        let nextSolButton = app.buttons["PhotosCollectionView.nextSolButton"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testImageLoad() {
        app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailView.saveButton"].exists)
    }
    
    func testImageSave() {
        app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.tap()
        app.buttons["PhotoDetailView.saveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }

}
