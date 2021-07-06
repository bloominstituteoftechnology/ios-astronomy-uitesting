//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by John Kouris on 11/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUp() {
        app.launchArguments = ["UITesting"]
        app.launch()
        
        continueAfterFailure = false
    }
    
    func testCollectionViewLoads() {
        XCTAssert(app.collectionViews.element.exists)
    }
    
    func testForwardBackwardNavigation() {
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 2"].exists)
        app.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
    }
    
    func testSavePhotoPopUp() {
        app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
        XCTAssert(app.buttons["Save to Photo Library"].exists)
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
    }
    
    func testPictureScrolling() {
        app.collectionViews.element.swipeUp()
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 7).exists)
        app.collectionViews.element.swipeDown()
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).exists)
    }
    
    func testSelectionAndViewsAppears() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
        app.assertTextExists("Camera:")
        app.assertTextExists("Mast Camera")
    }
    
}

extension XCUIApplication {
    func assertTextExists(_ staticText: String) {
        XCTAssert(staticTexts["\(staticText)"].exists)
    }
}
