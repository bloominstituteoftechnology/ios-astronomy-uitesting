//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Josh Kocsis on 7/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {

    let app = XCUIApplication()

    func testSaveImage() {
        app.launchArguments = ["UITesting"]
        app.launch()

        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"surfaceImage").element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()


        XCTAssert(app.staticTexts["Save to Photo Library"].exists)
    }

    func testChangeSol() {
        app.launchArguments = ["UITesting"]
        app.launch()

        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 16"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()


        XCTAssert(app.navigationBars["Sol 16"].buttons["PhotosCollectionViewController.NextSolButton"].exists)

    }

    func testSelectImage() {
        app.launchArguments = ["UITesting"]
        app.launch()

        let image = app.collectionViews.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"surfaceImage").element

        XCTAssertFalse(image.isSelected)
    }

    func testTapBackButton() {
        app.launchArguments = ["UITesting"]
        app.launch()

        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"surfaceImage").element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()


        XCTAssertFalse(app.navigationBars["Title"].buttons["Sol 15"].exists)
    }
}

