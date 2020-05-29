//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_loaner_226 on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSavePhoto() {
        
        app.collectionViews
            .children(matching: .cell)
            .element(boundBy: 4).otherElements.containing(.image, identifier:"AstronomyImage")
            .element
            .tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            .tap()
        app.alerts["Photo Saved!"]
            .scrollViews
            .otherElements
            .buttons["Okay"]
            .tap()
    }
    
}
