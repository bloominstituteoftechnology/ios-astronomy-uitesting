//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Breena Greek on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func test_picture_saved(){
        let app = XCUIApplication()
        app.launch()
        
        XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageCell").element.tap()
        
        let saveButtonTapped = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveButtonTapped.tap()
        
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
        XCTAssertTrue(saveButtonTapped.isEnabled)
    }
    
    func test_image_same_when_selected() {
        let app = XCUIApplication()
        app.launch()
        
        var expectedImage =  "PhotosCollectionViewController.ImageCell"
        
        var imageSelected = app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageCell").element
        imageSelected.tap()
        
        XCTAssertEqual(expectedImage, imageSelected.identifier)
        
    }
    
    func test_back_button() {
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageCell").element.tap()
        
        let backButtonTapped = app.navigationBars["Title"].buttons["Sol 1"]
        backButtonTapped.tap()
        
        backButtonTapped.accessibilityLabel = "Sol 1"
        
        
        XCTAssertTrue(app.staticTexts["Sol 1"].isEnabled)
    }
}
