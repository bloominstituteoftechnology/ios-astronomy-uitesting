//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Isaac Lyons on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        //app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSavePhoto() {
        sleep(2)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        //app.alerts["“Astronomy” Would Like to Access Your Photos"].scrollViews.otherElements.buttons["OK"].tap()
    }
    
    func testViewDifferentPhotos() {
        sleep(3)
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let title0 = app.staticTexts["PhotoDetailViewController.CameraLabel"].label
        
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
        
        XCTAssertNotEqual(title0, app.staticTexts["PhotoDetailViewController.CameraLabel"].label)
        
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        XCTAssertEqual(title0, app.staticTexts["PhotoDetailViewController.CameraLabel"].label)
    }
    
    func testChangingSol() {
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        sleep(3)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let sol1Photo = app.images["PhotoDetailViewController.ImageView"]
        
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        
        
        nextSolButton.tap()
        sleep(3)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        XCTAssertNotEqual(sol1Photo, app.images["PhotoDetailViewController.ImageView"])
    }
    
    
    
    private var app: XCUIApplication = XCUIApplication()
}
