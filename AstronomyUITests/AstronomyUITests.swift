//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jonalynn Masters on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
    }
    
    func testPreviousSol() {
        let app = XCUIApplication()
        
        _ = app.buttons["\(previousSolButton)"]
        previousSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testNextSol() {
        let app = XCUIApplication()
        
        _ = app.buttons["\(nextSolButton)"]
        nextSolButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
      func testSaveImage() {
          let app = XCUIApplication()
          
          app.collectionViews.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.tap()
          
          app.buttons["PhotoDetailViewController.SaveButton"].tap()
          
          XCTAssert(app.alerts["Photo Saved!"].exists)
          app.alerts["Photo Saved!"].buttons["Okay"].tap()
    
      }
    
    func testImageLoad() {
        app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(app.buttons["PhotoDetailView.saveButton"].exists)
    }
    
    
    private var app = XCUIApplication()
    
    private var saveToPhotoLibraryButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var alert: XCUIElement {
        return app.alerts.element
    }
    
    private var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
}
