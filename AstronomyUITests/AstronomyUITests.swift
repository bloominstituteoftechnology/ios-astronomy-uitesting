//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Diante Lewis-Jolley on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUp() {

        continueAfterFailure = false

        app.launchArguments = ["UITesting"]
        app.launch()

    }

    //Identify the UI Elements (likely everything)
    // Add accessibility identifiers to UI Elements
    // Add any convience methods to tap on elements
    // ALWAYS remember to verify behavior through assertions where possible

    func testingSavingPhoto() {

        let collectionViews = app.collectionViews["PhotoCollectionView"]
        let roverCell = collectionViews.cells.element(boundBy: 0)
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssert(saveButton.exists)
        XCTAssertTrue(collectionViews.exists)
        

        roverCell.tap()
        saveButton.tap()


    }

    func testNextSol() {

        let nextSolButton = app.buttons["PhotosCollectionControler.NextSolButton"]
        let backSolButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]

        XCTAssert(nextSolButton.exists)
        XCTAssert(backSolButton.exists)


        nextSolButton.tap()
        backSolButton.tap()
    }

    func testBackButton() {

        let roverCell = app.collectionViews.cells.element(boundBy: 0)
        let backButton = app.buttons["Sol 14"]

        roverCell.tap()
        backButton.tap()

        XCTAssert(app.navigationBars["Sol 14"].exists)
        XCTAssertTrue(backButton.exists)

    }

    func testScollingFeatures() {

        let roverCell = app.collectionViews

        roverCell.element.swipeUp()
        roverCell.element.swipeDown()
    }


}
