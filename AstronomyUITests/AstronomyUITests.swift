//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Matthew Martindale on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    func testSavingPhoto() {
        app.launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        // Test if detail label shows correct String
        let detailLabel = app.staticTexts["imageDetailLabel"]
        XCTAssertTrue(detailLabel.label == "Taken by 5 on 8/6/12, 6:00 PM (Sol 1)")
        
        // Test if photo was saved successfully
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let alertText = XCUIApplication().alerts["Photo Saved!"].scrollViews.otherElements.staticTexts["Photo Saved!"]
        XCTAssertTrue(alertText.label == "Photo Saved!")
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    func testViewDifferentSol() {
        app.launch()
        
        let app = XCUIApplication()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let sol2title = app.navigationBars["Sol 2"].staticTexts["Sol 2"]
        
        // Test if nav title correctly shows next sol
        XCTAssertTrue(sol2title.label == "Sol 2")
    }
    
    func testSwipe() {
        app.launch()
        // Swipe to the bottom of the collectionView
        XCUIApplication()/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        XCUIApplication()/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeUp()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 11).children(matching: .other).element.tap()
        let detailLabel = app/*@START_MENU_TOKEN@*/.staticTexts["imageDetailLabel"]/*[[".staticTexts[\"Taken by 5 on 8\/6\/12, 6:00 PM (Sol 1)\"]",".staticTexts[\"imageDetailLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        // Test if detail label shows correct String
        XCTAssertTrue(detailLabel.label == "Taken by 5 on 8/6/12, 6:00 PM (Sol 1)")
    }
    
    func testNavigationThroughApp() {
        app.launch()
        
        // Next Sol page
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let sol2title = app.navigationBars["Sol 2"].staticTexts["Sol 2"]
        XCTAssertTrue(sol2title.label == "Sol 2")
        // Scroll up and down
        let verticalScrollBar12PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 12 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 12 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar12PagesCollectionView.swipeUp()
        verticalScrollBar12PagesCollectionView.swipeDown()
        // tap on photo
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        let detailLabel = app.staticTexts["imageDetailLabel"]
        XCTAssertTrue(detailLabel.label == "Taken by 5 on 8/7/12, 6:00 PM (Sol 2)")
        // go back to collectionView
        app.navigationBars["Title"].buttons["Sol 2"].tap()
        XCTAssertTrue(sol2title.label == "Sol 2")
        // Go back to Sol 1
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let sol1title = app.navigationBars["Sol 1"].staticTexts["Sol 1"]
        XCTAssertTrue(sol1title.label == "Sol 1")
    }
    
}
