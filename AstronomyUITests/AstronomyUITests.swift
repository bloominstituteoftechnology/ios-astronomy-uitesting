//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Matthew Martindale on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    func testSavingPhoto() {
        app.launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        // Test if detail label shows correct String
        let detailLabel = app.staticTexts["imageDetailLabel"]
        XCTAssertTrue(detailLabel.label == "Taken by 5 on 8/6/12, 6:00 PM (Sol 1)")
        
        // Test if photo was saved successfully
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let alertText = XCUIApplication().alerts["Photo Saved!"].scrollViews.otherElements.staticTexts["Photo Saved!"]
        XCTAssertTrue(alertText.label == "Photo Saved!")
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
}
