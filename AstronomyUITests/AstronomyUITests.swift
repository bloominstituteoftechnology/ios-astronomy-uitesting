//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Chris Dobek on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: - Helper Properties
    private var app: XCUIApplication {
        XCUIApplication()
    }
    
    
    override func setUp()  {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()

    }
    
    func testNextSol() {
        
        let sol1NavigationBar = app.navigationBars["Sol 1"]
        sol1NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testPreviousSol() {
        
        let sol1NavigationBar = app.navigationBars["Sol 1"]
        sol1NavigationBar.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        
    }
    
    func testTapCell() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.children(matching: .image).element.tap()
    }
    
    func testSavePhoto() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.children(matching: .image).element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
