//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Gi Pyo Kim on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testSavePhoto() {
        
        let cell0 = cell(forIndex: 0)
        cell0.tap()
        
//        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        saveToPhotoLibraryStaticText.tap()
//        app.alerts["“Astronomy” Would Like to Access Your Photos"].scrollViews.otherElements.buttons["OK"].tap()
//
//        let titleNavigationBar = app.navigationBars["Title"]
//        titleNavigationBar.buttons["Sol 1"].tap()
//        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).otherElements.containing(.image, identifier:"CollectionViewCell").element.tap()
//        saveToPhotoLibraryStaticText.tap()
//        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
//        titleNavigationBar.buttons["Sol 2"].tap()
        
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var collectionViewsQuery: XCUIElementQuery {
        return app.collectionViews
    }
    
    private func cell(forIndex index: Int) -> XCUIElement {
        return collectionViewsQuery.children(matching: .cell).element(boundBy: index).otherElements.containing(.image, identifier:"CollectionViewCell").element
    }
}
