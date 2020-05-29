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

    // Perform test for saving a photo
    func testExample() throws {
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
}
