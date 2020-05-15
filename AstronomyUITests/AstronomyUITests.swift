//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ezra Black on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        super.setUp()
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSavingPhotoToLibrary() throws {
        let app = XCUIApplication()
        app.launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        app.navigationBars["Title"].buttons["Sol 1"].tap()
    }
    
    func testScrollingSpeed() throws {
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.swipeDown()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 9).children(matching: .other).element.swipeDown()
    }
    
    func testSwitchSols() throws {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let sol2NavigationBar = app.navigationBars["Sol 2"]
        sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }
    
    func testSwitchSolsAndSaveMultiplePhotos() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Sol 0"]/*@START_MENU_TOKEN@*/.buttons[">"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        let photoscollectionviewcontrollerNextsolbuttonButton = app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons[">"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        let sol2NavigationBar = app.navigationBars["Sol 2"]
        let photoscollectionviewcontrollerPrevioussolbuttonButton = sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["<"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerPrevioussolbuttonButton.tap()
        let collectionViewsQuery = app.collectionViews
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        element.tap()
        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveToPhotoLibraryStaticText.tap()
        let okayButton = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        okayButton.tap()
        let sol1Button = app.navigationBars["Title"].buttons["Sol 1"]
        sol1Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
        saveToPhotoLibraryStaticText.tap()
        okayButton.tap()
        sol1Button.tap()
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        photoscollectionviewcontrollerPrevioussolbuttonButton.tap()
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        sol2NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.tap()
        saveToPhotoLibraryStaticText.tap()
        okayButton.tap()
    }
    
    func testFullLifecycle() {
        let app = XCUIApplication()
        app.launch()
        let collectionViewsQuery = app.collectionViews
        let element = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        element.tap()
        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveToPhotoLibraryStaticText.tap()
        let okayButton = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        okayButton.tap()
        let titleNavigationBar = app.navigationBars["Title"]
        titleNavigationBar.buttons["Sol 1"].tap()
        let photoscollectionviewcontrollerNextsolbuttonButton = app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        photoscollectionviewcontrollerNextsolbuttonButton.tap()
        let element3 = collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element
        element3.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.swipeUp()
        element3.swipeUp()
        let element4 = collectionViewsQuery.children(matching: .cell).element(boundBy: 6).children(matching: .other).element
        element4.swipeUp()
        app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 45 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 45 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        element4.swipeUp()
        element.tap()
        saveToPhotoLibraryStaticText.tap()
        okayButton.tap()
        titleNavigationBar.buttons["Sol 3"].tap()
        let photoscollectionviewcontrollerPrevioussolbuttonButton = app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photoscollectionviewcontrollerPrevioussolbuttonButton.tap()
    }
    
    func testANewLifeCycle() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.swipeUp()
        let cell = collectionViewsQuery.children(matching: .cell).element(boundBy: 5)
        cell.otherElements.containing(.image, identifier:"MarsPlaceholder").element.swipeUp()
        let element = cell.children(matching: .other).element
        element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
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
