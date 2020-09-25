//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kenneth Jones on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var takenLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.TakenLabel"]
    }
    
    private var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSavingPhoto() throws {
        let collectionViewsQuery = app.collectionViews
        let elementsQuery = app.alerts["Photo Saved!"].scrollViews.otherElements
        let okayButton = elementsQuery.buttons["Okay"]
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
//
//        saveButton.tap()
//
//        okayButton.tap()
//
//        let sol1Button = app.navigationBars["Title"].buttons["Sol 1"]
//        sol1Button.tap()
        
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
        XCTAssertEqual(app.navigationBars["Title"].staticTexts["Title"].label, "Title")
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 6:00 PM (Sol 15)")
        XCTAssertEqual(cameraLabel.label, "Front Hazard Avoidance Camera")
        XCTAssertEqual(saveButton.label, "Save to Photo Library")
        
        saveButton.tap()
        
        XCTAssertEqual(elementsQuery.staticTexts["Photo Saved!"].label, "Photo Saved!")
        XCTAssertEqual(elementsQuery.staticTexts["The photo has been saved to your Photo Library!"].label, "The photo has been saved to your Photo Library!")
        
        okayButton.tap()
        
        XCTAssertEqual(app.navigationBars["Title"].staticTexts["Title"].label, "Title")
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 6:00 PM (Sol 15)")
        XCTAssertEqual(cameraLabel.label, "Front Hazard Avoidance Camera")
        XCTAssertEqual(saveButton.label, "Save to Photo Library")
        
//        sol1Button.tap()
//        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let verticalScrollBar3PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        verticalScrollBar3PagesCollectionView.swipeUp()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 15).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
//        sol1Button.tap()
//        verticalScrollBar3PagesCollectionView.swipeDown()
//        verticalScrollBar3PagesCollectionView.swipeDown()
//        verticalScrollBar3PagesCollectionView.swipeDown()
        
//        let app = XCUIApplication()
//        app.navigationBars["Sol 1"].staticTexts["Sol 1"].tap()
//        app.collectionViews.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
//        app.navigationBars["Title"].staticTexts["Title"].tap()
        
    }

}
