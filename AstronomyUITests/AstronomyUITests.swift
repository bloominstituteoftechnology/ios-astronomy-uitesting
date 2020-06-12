//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Cody Morley on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    //MARK: - Types -
    enum StringID: String {
        case solForward = "PhotosCollectionViewController.NextSolButton"
        case solBack = "PhotosCollectionViewController.PreviousSolButton"
        case detailImage = "PhotoDetailViewController.ImageView"
        case saveButton = "PhotoDetailViewController.SaveButton"
    }
    
    enum SolID: String {
        case sol14 = "Sol 14"
        case sol15 = "Sol 15"
        case sol16 = "Sol 16"
    }
    
    
    //MARK: - Test Environment Setup Paramenters -
    override func setUp() {
      let app = XCUIApplication()
      app.launchArguments = ["UITesting"]
      continueAfterFailure = false
      app.launch()
    }
    
    
    //MARK: - Tests - 
    func testViewNextSolImages() {
      let app = XCUIApplication()
        let nextButton = app.navigationBars[SolID.sol15.rawValue].buttons[StringID.solForward.rawValue]
      XCTAssert(nextButton.exists)
      nextButton.tap()
        XCTAssertTrue(app.navigationBars[SolID.sol16.rawValue].exists)
      XCTAssertFalse(app.navigationBars[SolID.sol15.rawValue].exists)
    }
    
    func testViewPreviousSolImages() {
        let app = XCUIApplication()
        let previousButton = app.navigationBars[SolID.sol15.rawValue].buttons[StringID.solBack.rawValue]
        XCTAssert(previousButton.exists)
        previousButton.tap()
        XCTAssertTrue(app.navigationBars[SolID.sol14.rawValue].exists)
        XCTAssertFalse(app.navigationBars[SolID.sol15.rawValue].exists)
    }
    
    func testDetailNavigation() {
        let app = XCUIApplication()
        let cell = app.cells.element(boundBy: 0)
        let detailPhoto = app.images[StringID.detailImage.rawValue]
        cell.tap()
        XCTAssertTrue(detailPhoto.exists)
    }
    
    func testSavePhoto() {
        let app = XCUIApplication()
        let cell = app.cells.element(boundBy: 0)
        let saveButton = app.buttons[StringID.saveButton.rawValue]
        
        cell.tap()
        XCTAssertTrue(saveButton.exists)
        saveButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
}
