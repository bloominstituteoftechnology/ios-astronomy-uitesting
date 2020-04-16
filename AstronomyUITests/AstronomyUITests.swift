//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_259 on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: - Properties
    
    private var app: XCUIApplication {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        //app.launchArguments.append("UITesting")
        return app
    }
    

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavePicture() {
        // UI tests must launch the application that they test.
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        app.collectionViews.children(matching: .cell).matching(identifier: "ImageCell").element(boundBy: 0).otherElements.containing(.image, identifier:"ImageView").element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
        //XCTAssertNoThrow(<#T##expression: T##T#>)
    }
    
    func testNextSol() {
        app.launch()
        
        
        let sol15NavigationBar = XCUIApplication().navigationBars["Sol 15"]
        sol15NavigationBar.staticTexts["Sol 15"].tap()
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testPreviousSol() {
        app.launch()
        
        
        let sol15NavigationBar = XCUIApplication().navigationBars["Sol 15"]
        sol15NavigationBar.staticTexts["Sol 15"].tap()
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testScrolling() {
        app.launch()
        
        XCUIApplication()/*@START_MENU_TOKEN@*/.collectionViews.containing(.cell, identifier:"ImageCell").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element",".collectionViews.containing(.cell, identifier:\"ImageCell\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        
    }
    
    func testOpenSolAndReturn() {
        app.launch()

        app.collectionViews.children(matching: .cell).matching(identifier: "ImageCell").element(boundBy: 0).otherElements.containing(.image, identifier:"ImageView").element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        
    }
    
    func testScrollingPastEndOfList() {
        app.launch()
        
        let imagecellCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.cell, identifier:"ImageCell").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 8 pages\").element",".collectionViews.containing(.cell, identifier:\"ImageCell\").element"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        imagecellCollectionView.swipeUp()
        
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
