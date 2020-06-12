//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Stephanie Ballard on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

// * make sure the sol label changes properly when you tap the next button
// * make sure that the back and front buttonsfor switching sols work properly
// * when clicking on collection view, does it properly open the detail view
// * do the labels in the cell update to the pictures details when the cell is tapped
// * does the save to library button work when tapped

class AstronomyUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testMoveToNextPreviousSol() {
        app.navigationBars.firstMatch.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertNotNil(app.navigationBars["Sol 2"])
        app.navigationBars.firstMatch.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertNotNil(app.navigationBars["Sol 1"])
    }

    func testCellTappedToDetail() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertNotNil(app.staticTexts["Taken by 5on 8/6/12, 5:00 PM (Sol 1)"])
    }
    
    func testSavePhotoToLibraryButtonTapped() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["Save to Photo Library"].tap()
                
        
    }
    
}
