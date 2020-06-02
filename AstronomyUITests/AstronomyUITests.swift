//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Thomas Dye on 6/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

@testable import Astronomy

class AstronomyUITests: XCTestCase {

    private var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testNavigateForward() {
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }

    func testNavigateBack() {
        app.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testSavePhoto() {
         app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
         XCTAssert(app.buttons["Save to Photo Library"].exists)
         app.buttons["PhotoDetailViewController.SaveButton"].tap()
         XCTAssert(app.alerts["Photo Saved!"].exists)
     }

     func testScrollingPhoto() {
         app.collectionViews.element.swipeUp()
         XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 7).exists)
         app.collectionViews.element.swipeDown()
         XCTAssert(app.collectionViews.children(matching: .cell).element(boundBy: 0).exists)
     }

}
