//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by macbook on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        
        //let app = XCUIApplication()
        app.launch()
        app.launchArguments = ["UITesting"]
        //          This string  ^^  is the launch argument that the application will look for to know that it use local data instead of making network calls
        
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSavingAPhoto() {
        
        
        //        let app = XCUIApplication()
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 7).children(matching: .other).element.tap()
        //        savePhotoButton.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
        
        
    }
    
    func testViewingAnotherSol() {
        
        XCTAssertEqual(app.navigationBars["Sol 1"].label, "Sol 1")
        nextSolButton.tap()
        
        XCTAssertEqual(app.navigationBars["Sol 2"].title, "Sol 2")
        
        nextSolButton.tap()
        
        XCTAssertEqual(app.navigationBars["Sol 3"].title, "Sol 3")
        
        
//        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    //MARK: Private Properties
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]

        //return app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var previousButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
}
