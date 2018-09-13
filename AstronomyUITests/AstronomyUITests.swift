//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lisa Sampson on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testTappingPreviousSol() {
        PhotoCollectionPage(testCase: self)
        .tapOnPreviousSol()
    }
    
    func testTappingNextSol() {
        PhotoCollectionPage(testCase: self)
        .tapOnNextSol()
    }
    
    func testTappingCollectionCell() {
        PhotoCollectionPage(testCase: self)
        .tapOnCollectionCell(at: 0)
    }
    
}
