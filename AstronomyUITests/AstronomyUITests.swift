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
        let cell0 = cellFor(index: 0)
        cell0.tap()
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
        XCTAssert(app.collectionViews.cells.count > 0)
        app.navigationBars/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertNotNil(cells)
        XCTAssert(app.collectionViews.cells.count > 0)

    }
    
    func testScrolling() {
        
        let app = XCUIApplication()
        
        app.otherElements.containing(.navigationBar, identifier:"Sol 1").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
      
        //how to test scrolling?  If the images are different on screen?
        //If indexes of cells are different?
    }
    
    func testToDetailAndBack() {
        let app = XCUIApplication()
        let cell1 = cellFor(index: 1)
        cell1.tap()
        let detailImage = app.images["PhotoDetailViewController.ImageView"]
        let detailLabel = app.staticTexts["PhotoDetailViewController.DetailLabel"]
        let detailCamera = app.staticTexts["PhotoDetailViewController.CameraLabel"]
        XCTAssertNotNil(detailImage)
        XCTAssertNotNil(detailLabel)
        XCTAssertNotNil(detailCamera)
        
        app.navigationBars.buttons.element(boundBy: 0).tap()
        let cells = app.cells["PhotoCollectionViewController.PhotoCell"]
        XCTAssertNotNil(cells)
        XCTAssert(app.collectionViews.cells.count > 0)
        app.navigationBars/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertNotNil(cells)
        XCTAssert(app.collectionViews.cells.count > 0)
        
    }
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    func cellFor(index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
}


