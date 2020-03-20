//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ufuk Türközü on 19.03.20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: - Properties
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var saveAlert: XCUIElement {
        return app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
    }
    
    private var sol1Button: XCUIElement {
        return app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var sol2Button: XCUIElement {
        return app.navigationBars["Sol 2"].buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var sol2PreButton: XCUIElement {
        return app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
    private var sol3PreButton: XCUIElement {
        return app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
    private var backBarButton: XCUIElement {
        return  app.navigationBars["Title"].buttons["Sol 1"]
    }
    
    // MARK: - SetUp
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    // MARK: - Tests
    func testSavingPhoto() {
        app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element.tap()
        saveButton.tap()
        saveAlert.tap()
                
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testChangeSol() {
        sol1Button.tap()
        XCTAssert(sol1Button.exists)
        XCTAssertTrue(app.navigationBars.staticTexts["Sol 1"].exists)
        
        sol2Button.tap()
        XCTAssert(sol2Button.exists)
        XCTAssert(sol2PreButton.exists)
        XCTAssertTrue(app.navigationBars.staticTexts["Sol 2"].exists)
        
        sol3PreButton.tap()
        XCTAssert(sol3PreButton.exists)
        XCTAssertTrue(app.navigationBars.staticTexts["Sol 3"].exists)
        sol2PreButton.tap()
        //XCTAssert(sol2PreButton.exists)
        //XCTAssertTrue(app.navigationBars.staticTexts["Sol 2"].exists)
    }
    
    func testReturnToCV() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        XCTAssert(saveButton.exists)
        backBarButton.tap()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.tap()
        backBarButton.tap()
        
    }
    
    func testScroll() {
        app.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element.swipeUp()
        
    }
    
    

}
