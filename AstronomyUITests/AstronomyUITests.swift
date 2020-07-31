//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by James McDougall on 7/30/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//
import XCTest
class AstronomyUITests: XCTestCase {
    
    //MARK: - Properties -
    var app = XCUIApplication()
    
    //MARK: - Test Methods -
    func launch() {
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testDetailViewLoad() {
        launch()
        XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        let buttonString = app.staticTexts["Save to Photo Library"]
        XCTAssertEqual(buttonString.label, "Save to Photo Library")
    }
    
    func testSavingPhotos() {
        launch()
        setUp()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let appAlert = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        XCTAssertEqual(appAlert.label, "Okay")
    }
    
    func testSwitchingSols() {
        launch()
        setUp()
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 16"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        let titleString = app.navigationBars.staticTexts["Sol 15"].label
        XCTAssertEqual(titleString, "Sol 15")
    }
    
    func testBackButton() {
        launch()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.navigationBars.buttons["Sol 15"].tap()
        let solOneTitleLabel = app.navigationBars.staticTexts["Sol 15"].label
        XCTAssertEqual(solOneTitleLabel, "Sol 15")
    }
}
