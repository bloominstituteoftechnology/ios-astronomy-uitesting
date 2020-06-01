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
            .setNewTitle()
            .tapOnPreviousSol()
            .verifyTitleChange()
    }
    
    func testTappingNextSol() {
        PhotoCollectionPage(testCase: self)
            .setNewTitle()
            .tapOnNextSol()
            .verifyTitleChange()
    }
    
    func testTappingCollectionCell() {
        PhotoCollectionPage(testCase: self)
            .tapOnCollectionCell(at: 0)
    }
    
    func testTappingSaveButton() {
        PhotoCollectionPage(testCase: self)
            .tapOnCollectionCell(at: 0)
        PhotoDetailPage(testCase: self)
            .tapOnSave()
            .verifySaveWorks()
    }
    
}
