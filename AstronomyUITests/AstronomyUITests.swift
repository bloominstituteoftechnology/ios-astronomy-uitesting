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
        // Setting the launch arguments caused it to not load any images, so I instead added sleep statements to the tests to allow time for the network calls to happen
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
        let previousSolButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        sleep(3)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let sol1Label = app.staticTexts["PhotoDetailViewController.DetailLabel"].label
        
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        nextSolButton.tap()
        sleep(3)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertNotEqual(sol1Label, app.staticTexts["PhotoDetailViewController.DetailLabel"].label)
        
        app.navigationBars["Title"].buttons["Sol 2"].tap()
        previousSolButton.tap()
        sleep(1)
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssertEqual(sol1Label, app.staticTexts["PhotoDetailViewController.DetailLabel"].label)
    }
    
    
    
    private var app: XCUIApplication = XCUIApplication()
}
