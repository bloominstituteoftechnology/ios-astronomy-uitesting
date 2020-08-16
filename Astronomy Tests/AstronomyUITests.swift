//
//  AstronomyUITests.swift
//  Astronomy
//
//  Created by Ian French on 7/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        super.setUp()
        app.launchArguments.append("UITesting")
    }

    func testImageDetailView()  {

        app.launch()

        app.collectionViews.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
        let imageDetail = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 5)
        XCTAssert(imageDetail)
    }

    func testNewSol()  {

        app.launch()

        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 16"].staticTexts["Sol 16"].tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }

    func testPhotoSave()  {

        app.launch()

        let imageTapped = app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element
        imageTapped.tap()

        let saveImageButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssert(saveImageButton.isHittable)
        saveImageButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")

        let saveTappedAlert = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        XCTAssert(saveTappedAlert.isHittable)
        saveTappedAlert.tap()

    }

    func testReturnFromDetailView()  {

        app.launch()

        let solText = app.navigationBars["Sol 15"].staticTexts["Sol 15"]

        app.collectionViews.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        XCTAssertEqual(solText.label, "Sol 15")
    }
}
