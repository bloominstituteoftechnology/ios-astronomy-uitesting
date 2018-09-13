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
    
    func testTappingNextSolChangesSolCorrectly() {
        AstronomyListPage(testCase: self).nextSol()

        sleep(4)
        XCTAssertFalse(app.navigationBars["Sol 1"].exists)
        XCTAssertTrue(app.navigationBars["Sol 2"].exists)
    }
    
    func testTappingPreviousSolChangesSolCorrectly() {
        AstronomyListPage(testCase: self).nextSol()
        AstronomyListPage(testCase: self).nextSol()
        AstronomyListPage(testCase: self).nextSol()
        AstronomyListPage(testCase: self).nextSol()
        
        sleep(2)
        
        AstronomyListPage(testCase: self).previousSol()
        
        sleep(2)
        
        XCTAssertFalse(app.navigationBars["Sol 12"].exists)
        XCTAssertTrue(app.navigationBars["Sol 10"].exists)
    }
    
}
