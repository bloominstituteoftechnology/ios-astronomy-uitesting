//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dahna on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    
    override func setUp() {
        
        super.setUp()
        
        var app: XCUIApplication {
            return XCUIApplication()
        }
        
        app.launchArguments = ["UITesting"]
    }
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        let collectionViewsQuery = app.collectionViews
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element
        element.tap()
        
        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveToPhotoLibraryStaticText.tap()
        
        let okayButton = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        okayButton.tap()
        
        let titleNavigationBar = app.navigationBars["Title"]
        titleNavigationBar.buttons["Sol 1"].tap()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
        saveToPhotoLibraryStaticText.tap()
        okayButton.tap()
        titleNavigationBar.buttons["Sol 2"].tap()
        element.swipeUp()
        
        let element2 = collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element
        element2.swipeUp()
        element2.swipeUp()
        element2.swipeUp()
        element2.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 9).children(matching: .other).element.tap()
        
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
