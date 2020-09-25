//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Rob Vance on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    func testSavingPhoto() {
        // Provides an opportunity to reset the state and to throw errors before call each test method
        try! setUpWithError()
        
        let app = XCUIApplication()
        
        app.launch()
        app.collectionViews.children(matching:.cell).element(boundBy:0).otherElements.containing(.image,identifier:"imageCell").element.tap()
        saveButton.tap()
        let photoSavedAlert = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        
        XCTAssertEqual(photoSavedAlert.label, "Okay")
        
    }
    
    func testChangingSols() {
        try! setUpWithError()
        
        app.launch()
        let app = XCUIApplication()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let newSol = app.navigationBars["Sol 10"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertEqual(newSol.label, "\(newSol.label)")
        
    }
    
    func testViewImageDetails() {
        try! setUpWithError()
        
        app.launch()
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.tap()
        let imageDetail = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        
        XCTAssertTrue(imageDetail)
    }
    
    func testLeavePhotoDetail() {
        try! setUpWithError()
        
        app.launch()
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let solLabel = app.navigationBars["Title"].buttons["Sol 1"]
        
        XCTAssertEqual(solLabel.label, "Sol 1")
    }
    
}
