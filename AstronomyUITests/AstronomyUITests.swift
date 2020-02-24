//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Aaron Cleveland on 2/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        continueAfterFailure = false

        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testViewNextSol() {

        XCTAssert(sol15Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
        nextSolButton.tap()
        XCTAssert(sol16Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
    }

    func testViewPreviousSol() {
        XCTAssert(sol15Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
        previousSolButton.tap()
        XCTAssert(sol14Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
    }

    func testCollectionViewScroll() {
        XCTAssert(sol15Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
        nextSolButton.tap()
        XCTAssert(sol16Title.exists)
        XCTAssert(previousSolButton.exists)
        XCTAssert(nextSolButton.exists)
        app.collectionViews.cells.element(boundBy:3).swipeUp()
        XCTAssert(app.collectionViews.cells.element(boundBy: 9).isHittable)
        app.collectionViews.cells.element(boundBy: 9).swipeDown()
        XCTAssert(app.collectionViews.cells.element(boundBy:3).isHittable)
    }
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }

    private var saveImageButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }

    private var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }

    private var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }

    private var backSol15Button: XCUIElement {
        return app.buttons["Sol 15"]
    }

    private var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }

    private var roverAndDateLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.TakenByLabel"]
    }

    private var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }

    private var sol14Title: XCUIElement {
        return app.navigationBars["Sol 14"]
    }

    private var sol15Title: XCUIElement {
        return app.navigationBars["Sol 15"]
    }

    private var sol16Title: XCUIElement {
        return app.navigationBars["Sol 16"]
    }
}
