//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Thomas Cacciatore on 6/27/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
        continueAfterFailure = false
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let detailImage = app.images["PhotoDetailViewController.ImageView"]
        let detailLabel = app.staticTexts["PhotoDetailViewController.DetailLabel"]
        let detailCamera = app.staticTexts["PhotoDetailViewController.CameraLabel"]
        XCTAssertNotNil(detailImage)
        XCTAssertNotNil(detailLabel)
        XCTAssertNotNil(detailCamera)
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        app.alerts["Photo Saved!"].tap()
        app.alerts.buttons["Okay"].tap()
        
    }
    
    //Test Viewing Another Sol
    
    func testViewingAnotherSol()  {
        
        let app = XCUIApplication()
        let cells = app.cells["PhotoCollectionViewController.PhotoCell"]
        app.navigationBars/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertNotNil(cells)
        app.navigationBars/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertNotNil(cells)
    }
}
