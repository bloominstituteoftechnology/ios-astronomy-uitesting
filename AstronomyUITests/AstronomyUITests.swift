//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Conner on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testTappingCellGoesToDetailViewAndGoesBack() {
        AstronomyListPage(testCase: self)
        .collectionCell(at: 0)
        .tap()
        
        AstronomyListPage(testCase: self)
            .navigationBar(withTitle: "Title")
            .buttons["Sol 1"]
            .tap()
        
        XCTAssertFalse(app.navigationBars["Title"].exists)
    }
    
}
