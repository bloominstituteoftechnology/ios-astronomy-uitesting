//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Karen Rodriguez on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments.append("UITesting")
        return app
    }
    
    private func getCell(at index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index).children(matching: .other).element
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCleanLaunch() {
        // UI tests must launch the application that they test.
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testSavingPhoto() {
        
        app.launch()
        getCell(at: 0).tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
        
        getCell(at: 1).tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
    }
    
    func testScrolling() {
        app.launch()
        getCell(at: 0).swipeUp()
    }
    
    func testNextSol() {
        app.launch()
        
        getCell(at: 0).tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        getCell(at: 0).tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
    }
    
    func testPrevSol() {
        app.launch()
        
        getCell(at: 0).tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
        app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        getCell(at: 0).tap()
        app.navigationBars["Title"].buttons.element(boundBy: 0).tap()
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
