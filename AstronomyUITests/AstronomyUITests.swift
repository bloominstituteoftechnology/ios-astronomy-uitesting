//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ryan Murphy on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    
    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
    }
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var takenByRoverlabel: XCUIElement {
        return app.staticTexts["takenByRover"]
    }
    
    
    func testSavePhoto() {
        
        let app = XCUIApplication()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertEqual(takenByRoverlabel.label, "Taken by 5 on 8/19/12, 8:00 PM (Sol 14)")
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssertTrue(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
        XCTAssertFalse(app.alerts["Photo Saved!"].exists)
        XCTAssertEqual(takenByRoverlabel.label, "Taken by 5 on 8/19/12, 8:00 PM (Sol 14)")
        
    }
    
    
    func testChangeSolToNextX2() {
        
        let app = XCUIApplication()
        
        app.navigationBars["Sol 14"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].exists)
        app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].buttons["PhotosCollectionViewController.NextSolButton"].exists)
    }
    
    func testChangSolUpAndDown() {
    
    let app = XCUIApplication()
    
    app.navigationBars["Sol 14"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
    XCTAssertTrue(app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].exists)
    app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
    XCTAssertTrue(app.navigationBars["Sol 14"].buttons["PhotosCollectionViewController.NextSolButton"].exists)
    }
    //    prevItem.accessibilityIdentifier = "PhotosCollectionViewController.PreviousSolButton"
    //    nextItem.accessibilityIdentifier = "PhotosCollectionViewController.NextSolButton"
    
}

