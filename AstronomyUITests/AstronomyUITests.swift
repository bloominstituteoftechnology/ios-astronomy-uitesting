//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kelson Hartle on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    private var app: XCUIApplication {
        XCUIApplication()
    }
    
    var solLabel: String {
        return app.navigationBars.element(boundBy: 0).identifier
    }
    
    private var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }

    
        
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        app.launchArguments = (["UITesting"])

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() throws {
        // UI tests must launch the application that they test.
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.cells["Cell 0"].children(matching: .other).element.tap()
        
        let titleNavigationBar = app.navigationBars["Title"]
        titleNavigationBar.buttons["Sol 1"].tap()
        
        let photoscollectionviewcontrollerNextsolbuttonButton = app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        
        let photoscollectionviewcontrollerNextsolbuttonButton2 = app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerNextsolbuttonButton2.tap()
        photoscollectionviewcontrollerNextsolbuttonButton2.tap()
        
        let photoscollectionviewcontrollerNextsolbuttonButton3 = app.navigationBars["Sol 12"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerNextsolbuttonButton3.tap()
        photoscollectionviewcontrollerNextsolbuttonButton3.tap()
        collectionViewsQuery.cells["Cell 4"].children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        titleNavigationBar.buttons["Sol 14"].tap()
        
        
    
    }
    
    func testViewingCell() {
        app.launch()

        
                
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
