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
    
    func testChangingSol() {
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        
        sleep(4)
        
//        XCUIApplication().navigationBars["Sol 1"].staticTexts["Sol 1"].tap()
        nextSolButton.tap()
        
        sleep(4)
        
        XCTAssertNotEqual(sol2firstImage, app.collectionViews.children(matching: .cell).element(boundBy: 0).images)
        app.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        
        sleep(4)
        
        XCTAssertEqual(sol2firstImage, app.collectionViews.children(matching: .cell).element(boundBy: 0).images)
    }
    
    private var app: XCUIApplication = XCUIApplication()
}
