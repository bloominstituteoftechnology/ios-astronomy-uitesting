//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dahna on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var collectionView: XCUIElementQuery {
        return app.collectionViews
    }
    
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
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
        
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 2"].tap()
        
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element
        element.swipeUp()
        
        let element2 = collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element
        element2.swipeUp()
        element.swipeUp()
        
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 9)
        cell.children(matching: .other).element.swipeDown()
        cell.otherElements.containing(.image, identifier:"MarsPlaceholder").element.swipeDown()
        element2.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
    
    func testSavePhotoTapped() throws {
        let cell = collectionView.cells.element(boundBy: 0)
        cell.tap()
        
        let save = app.buttons["PhotoDetailViewController.SaveButton"]
        save.tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
        
        app.alerts.buttons["Okay"].tap()
    }

    func testScrollPhotos() {
        collectionView.element.swipeUp()
        collectionView.element.swipeDown()
    }
    
    func testNextSolButton() {
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testCellTap() {
        let nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
        nextSolButton.tap()
        
        XCTAssert(app.navigationBars["Sol 16"].exists)
        
        let cell = collectionView.cells.element(boundBy: 2)
        cell.tap()
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
