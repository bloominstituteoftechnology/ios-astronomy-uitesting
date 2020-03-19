//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jon Bash on 2019-12-12.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    // MARK: - Setup
    
    let app: XCUIApplication = XCUIApplication()
    
    // convenience elements
    
    var cells: [XCUIElement] {
        return app.collectionViews.cells.allElementsBoundByIndex
    }
    
    var prevSolButton: XCUIElement {
        return app.navigationBars.firstMatch.buttons[prevSolButtonID]
    }
    var nextSolButton: XCUIElement {
        return app.navigationBars.firstMatch.buttons[nextSolButtonID]
    }
    
    var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    var photoPermissionAlert: XCUIElement {
        return app.alerts["“Astronomy” Would Like to Access Your Photos"]
    }
    var photoSavedAlert: XCUIElement {
        return app.alerts["Photo Saved!"]
    }
    
    // Strings
    
    let sol14 = "Sol 14"
    let sol15 = "Sol 15"
    let sol16 = "Sol 16"
    
    let prevSolButtonID = "PrevSolButton"
    let nextSolButtonID = "NextSolButton"
    let prevSolButtonText = "<"
    let nextSolButtonText = ">"
    
    let savePhotoButtonText = "Save to Photo Library"
    
    let detailVCDescriptionID = "DetailVCDescription"
    let detailVCCameraLabelID = "DetailVCCameraLabel"
    
    // Set Up

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        
        app.launch()
    }

    // MARK: - Tests
    
    func testPhotoCellsExist() {
        XCTAssertFalse(cells.isEmpty)
        XCTAssertTrue(app.collectionViews.cells.images.firstMatch.exists)
    }
    
    func testSavingPhoto() {
        cells.first?.tap()
        
        XCTAssertTrue(savePhotoButton.exists)
        XCTAssertEqual(savePhotoButton.label, savePhotoButtonText)
        savePhotoButton.tap()
        
        XCTAssertTrue(photoSavedAlert.exists)
        let saveOKButton = photoSavedAlert.scrollViews.otherElements.buttons["OK"]
        XCTAssertTrue(saveOKButton.exists)
        saveOKButton.tap()
        XCTAssertFalse(photoSavedAlert.exists)
    }
    
    func testViewingOtherSols() {
        // sol 15
        XCTAssertFalse(app.navigationBars[sol14].exists)
        XCTAssertTrue(app.navigationBars[sol15].exists)
        XCTAssertFalse(app.navigationBars[sol16].exists)
        
        XCTAssertFalse(cells.isEmpty)
        
        XCTAssertTrue(prevSolButton.exists)
        XCTAssertEqual(prevSolButton.label, prevSolButtonText)
        XCTAssertTrue(nextSolButton.exists)
        XCTAssertEqual(nextSolButton.label, nextSolButtonText)
        
        prevSolButton.tap()
        
        // sol 14
        XCTAssertTrue(app.navigationBars[sol14].exists)
        XCTAssertFalse(app.navigationBars[sol15].exists)
        XCTAssertFalse(app.navigationBars[sol16].exists)
        XCTAssertFalse(cells.isEmpty)
        
        prevSolButton.tap()
        
        // still sol 14
        XCTAssertTrue(app.navigationBars[sol14].exists)
        XCTAssertFalse(app.navigationBars[sol15].exists)
        XCTAssertFalse(app.navigationBars[sol16].exists)
        XCTAssertFalse(cells.isEmpty)
        
        nextSolButton.tap()
        
        // sol 15
        XCTAssertFalse(app.navigationBars[sol14].exists)
        XCTAssertTrue(app.navigationBars[sol15].exists)
        XCTAssertFalse(app.navigationBars[sol16].exists)
        
        nextSolButton.tap()
        
        // sol 16
        XCTAssertFalse(app.navigationBars[sol14].exists)
        XCTAssertFalse(app.navigationBars[sol15].exists)
        XCTAssertTrue(app.navigationBars[sol16].exists)
        XCTAssertFalse(cells.isEmpty)
    }
    
    func testScrollAndDetails() {
        for _ in 1...10 {
            app.swipeUp()
        }
        
        cells.last?.tap()
        
        let lastDetailVCNavBar = app.navigationBars["Sol 15 - Photo 32353"]
        let lastDetailVCBackButton = lastDetailVCNavBar.buttons["Sol 15"]
        
        XCTAssertTrue(lastDetailVCNavBar.exists)
        XCTAssertEqual(app.staticTexts[detailVCDescriptionID].label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        XCTAssertEqual(app.staticTexts[detailVCCameraLabelID].label, "Navigation Camera")
        XCTAssertEqual(lastDetailVCBackButton.label, sol15)
        
        lastDetailVCBackButton.tap()
        
        XCTAssertTrue(app.navigationBars[sol15].exists)
        
        for _ in 1...10 {
            app.swipeDown()
        }
        
        cells.first?.tap()
        
        let firstDetailVCNavBar = app.navigationBars["Sol 15 - Photo 725"]
        let firstDetailVCBackButton = firstDetailVCNavBar.buttons["Sol 15"]
        
        XCTAssertTrue(firstDetailVCNavBar.exists)
        XCTAssertEqual(app.staticTexts[detailVCDescriptionID].label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        XCTAssertEqual(app.staticTexts[detailVCCameraLabelID].label, "Front Hazard Avoidance Camera")
        XCTAssertEqual(firstDetailVCBackButton.label, sol15)
        
        firstDetailVCBackButton.tap()
        
        XCTAssertTrue(app.navigationBars[sol15].exists)
    }
}
