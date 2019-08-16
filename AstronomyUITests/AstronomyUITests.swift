//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Michael Stoffer on 8/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var prevButton : XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    private var nextButton : XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var imageCell : XCUIElement {
        return app.collectionViews["PhotosCollectionViewController.ImageCell"]
    }
    
    private var saveButton : XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
        
    }

    func testGoToPreviousSol() {
        prevButton.tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testGoToNextSol() {
        nextButton.tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testImageLoad() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageCell").element.tap()
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
    }
    
    func testImageSave() {
        app.collectionViews.children(matching: .cell).element(boundBy: 4).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageCell").element.tap()
        XCTAssert(app.images["PhotoDetailViewController.ImageView"].exists)
        
        saveButton.tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
}
