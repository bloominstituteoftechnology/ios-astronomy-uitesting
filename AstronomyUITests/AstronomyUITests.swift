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
