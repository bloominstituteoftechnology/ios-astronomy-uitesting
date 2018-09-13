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
        app.launch()
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
            .buttons["Sol 15"]
            .tap()
        
        XCTAssertFalse(app.navigationBars["Title"].exists)
    }
    
    func testTappingNextSolChangesSolCorrectly() {
        AstronomyListPage(testCase: self).nextSol()

        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
    }
    
    func testTappingPreviousSolChangesSolCorrectly() {
        AstronomyListPage(testCase: self).nextSol()
        AstronomyListPage(testCase: self).previousSol()
        AstronomyListPage(testCase: self).previousSol()
        
        
        XCTAssertFalse(app.navigationBars["Sol 15"].exists)
        XCTAssertTrue(app.navigationBars["Sol 14"].exists)
    }
    
    func testDetailViewForCellHasCorrectData() {
        AstronomyListPage(testCase: self)
            .collectionCell(at: 0)
            .tap()
        
        print(AstronomyDetailPage(testCase: self).cameraLabel.title)
    }
    
}
