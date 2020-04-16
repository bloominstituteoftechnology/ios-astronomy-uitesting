//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lydia Zhang on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
        
    }

    func testNextSol() {
        app.navigationBars["Sol 10"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 11"].exists)
    }
    func testPreSol() {
        app.navigationBars["Sol 11"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 10"].exists)
    }
    
    
}
