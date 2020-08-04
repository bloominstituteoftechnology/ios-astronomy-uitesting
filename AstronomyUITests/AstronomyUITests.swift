//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Morgan Smith on 7/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app = XCUIApplication()

    func launch() -> XCUIApplication {
           // UI tests must launch the application that they test.
           let app = XCUIApplication()
           app.launch()
           return app
       }


    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testDetailNavigation() {
        let app = launch()
        let image = app.collectionViews.children(matching: .cell).element(boundBy: 0).images["photoImage"]
        image.tap()
        let selectedPhoto = app.images["PhotoDetailViewController.ImageView"]
        XCTAssertTrue(selectedPhoto.exists)
    }

    func testSave() {
        let app = launch()
        let image = app.collectionViews.children(matching: .cell).element(boundBy: 0).images["photoImage"]
        image.tap()
        let saveToPhotoLibraryStaticText = app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        saveToPhotoLibraryStaticText.tap()

        let okayButton = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        XCTAssertTrue(okayButton.exists)
        okayButton.tap()
    }

    func testMoveForwardOneSol() {
        let app = launch()
        
        app.navigationBars["Sol 14"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let sol15 = app.navigationBars["Sol 15"].staticTexts["Sol 15"]
        XCTAssertTrue(sol15.exists)

    }



}
