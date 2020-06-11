//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by De MicheliStefano on 13.09.18.
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
    
    override func tearDown() {
        super.tearDown()
    }
    
//    func testExample() {
//        let app = XCUIApplication()
//        print(app)
//    }

    func testViewingNextSol() {
        AstronomyPage(testCase: self)
        .tapOnNextSolButton()
        .verifyViewingNextSol(after: 15)
    }
    
    func testViewingPreviousSol() {
        AstronomyPage(testCase: self)
        .tapOnPreviousSolButton()
        .verifyViewingPreviousSol(after: 15)
    }
    
    func testClickOnFirstCell() {
        AstronomyPage(testCase: self)
        .verifyTapOnViewCell(at: 0)
    }
    
    func testSavePhoto() {
        AstronomyPage(testCase: self)
        .verifySavePhoto(at: 0)
    }
    
}
