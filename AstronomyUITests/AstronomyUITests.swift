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
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSavingPhoto() throws {
        
        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
        
        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveToPhotoLibraryStaticText.tap()
        
        let elementsQuery = app.alerts["Photo Saved!"].scrollViews.otherElements
        let okayButton = elementsQuery.buttons["Okay"]
        okayButton.tap()
        
        let sol1Button = app.navigationBars["Title"].buttons["Sol 1"]
        sol1Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
        app.staticTexts["Taken by 5 on 8/6/12, 6:00 PM (Sol 1)"].tap()
        app.staticTexts["Mast Camera"].tap()
        saveToPhotoLibraryStaticText.tap()
        elementsQuery.staticTexts["Photo Saved!"].tap()
        elementsQuery.staticTexts["The photo has been saved to your Photo Library!"].tap()
        okayButton.tap()
        sol1Button.tap()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let verticalScrollBar3PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar3PagesCollectionView.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 15).otherElements.containing(.image, identifier:"GoToDetail").element.tap()
        sol1Button.tap()
        verticalScrollBar3PagesCollectionView.swipeDown()
        verticalScrollBar3PagesCollectionView.swipeDown()
        verticalScrollBar3PagesCollectionView.swipeDown()
        
    }

}
