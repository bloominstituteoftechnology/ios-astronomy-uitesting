//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jesse Ruiz on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false
        
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    // MARK: - Properties
    
    private var app: XCUIApplication { return XCUIApplication() }
    
    // MARK: - UITests
    
    func testSavingPhoto() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
    
    func testViewNextSol() {
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testViewPreviousSol() {
        app.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testScrollThroughPhotos() {
        
        app.collectionViews.element.swipeUp()
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 10).exists)
        app.collectionViews.element.swipeDown()
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).exists)
    }
    
    func testLookAtDetailAndGoBack() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.tap()
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
        XCTAssert(app.buttons["Sol 15"].exists)
        app.buttons["Sol 15"].tap()
        XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).exists)
        XCTAssert(app.navigationBars["Sol 15"].exists)
    }
}
