//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Sean Acres on 8/15/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        app.launchArguments = ["UITesting"]

        print(app)
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    var savePhotoButton: XCUIElement {
        let button = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    var nextSolButton: XCUIElement {
        let button = app.buttons["PhotosCollectionViewController.NextSolButton"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    var previousSolButton: XCUIElement {
        let button = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        XCTAssertTrue(button.exists)
        return button
    }
    
    func testSavePhoto() {
        let cell = app.cells["PhotosCollectionVC.Sol 15.PhotoCell.Index[0, 0]"]
        XCTAssertTrue(cell.exists)
        cell.tap()
        savePhotoButton.tap()
        
//        let alert = app.alerts["PhotoDetailViewController.PhotoSavedAlert"]
//        XCTAssertTrue(alert.exists)
    }
    
    func testViewNextAndPreviousSol() {
        nextSolButton.tap()
        
        let nextCell = app.cells["PhotosCollectionVC.Sol 16.PhotoCell.Index[0, 0]"]
        XCTAssertTrue(nextCell.exists)
        
        previousSolButton.tap()
        let previousCell = app.cells["PhotosCollectionVC.Sol 15.PhotoCell.Index[0, 0]"]
        XCTAssertTrue(previousCell.exists)
    }
    

}
