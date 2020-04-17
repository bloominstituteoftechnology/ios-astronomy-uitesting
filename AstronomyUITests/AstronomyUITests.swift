//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by denis cedeno on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false

          let app = XCUIApplication()
          app.launchArguments = ["UITesting"]
          app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavePhoto() {
        
        let app = XCUIApplication()

        app.collectionViews
            .children(matching: .cell).element(boundBy: 1)
            .children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()

        
    }

    func testNextButtonTapped() {
        XCUIApplication()
            .navigationBars["Sol 15"]
    /*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testPreviousButtonTapped() {
        
        let app = XCUIApplication()
        
        app.navigationBars["Sol 15"]
    /*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 16"]
/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
       
        
    }
    
    func testNextButtonViewPhotoAndBackToCollectionView() {
        let app = XCUIApplication()
 XCUIApplication()
            .navigationBars["Sol 15"]
    /*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.collectionViews
        .children(matching: .cell).element(boundBy: 1)
        .children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 16"].tap()
        
    }
}
