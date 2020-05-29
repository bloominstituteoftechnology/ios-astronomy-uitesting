//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Claudia Contreras on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        
        app.launchArguments.append("UITesting")
    }

    // Test the user clicking a photo and opening up the detailView
    func testViewImageDetail() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        let imageTapped = app.collectionViews.children(matching: .cell).element(boundBy: 6).otherElements.containing(.image, identifier:"com.astronomy.imagecell.image").element
        imageTapped.tap()
        
        let photoDetail = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        
        XCTAssert(photoDetail)
        
    }
    
    // Perform test for saving a photo
    func testSavePhoto() throws {
        // Click the image
        let app = XCUIApplication()
        app.launch()
        let imageTapped = app.collectionViews.children(matching: .cell).element(boundBy: 2).otherElements.containing(.image, identifier:"com.astronomy.imagecell.image").element
        imageTapped.tap()
        
        
        //Is the user pushing the Save Button?
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssert(saveButton.isHittable)
        
        //Push the save button
        saveButton.tap()
        
        // Did the right alert show up?
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
        
        // Tap ok on the alerts
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    // Perform test on viewing a new Sol
    func testViewNewSol() throws {
        let app = XCUIApplication()
        app.launch()
        
        let nextSolArrow = app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            
            // User tapped the next button
            nextSolArrow.tap()
        
        // Is the user on the 2nd sol
        XCTAssert(app.navigationBars["Sol 2"].exists)
        
    }
    
    //Perform test on going back from detail view
    func testGoingBack() throws {
        let app = XCUIApplication()
        app.launch()
        
        // User opens an image
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"com.astronomy.imagecell.image").element.tap()
        XCTAssert(app.navigationBars["Title"].exists)
        
        // User taps back on the nav
        app.navigationBars["Title"].buttons["Sol 1"].tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
                
    }
}
