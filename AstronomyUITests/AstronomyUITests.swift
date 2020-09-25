//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Gladymir Philippe on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//


import XCTest

@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    func testSavingPhotoLibrary() {
        try! setUpWithError()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).images["imageCell"].tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"savePhotoToLibraryButton \"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let completedAlert = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        XCTAssertEqual(completedAlert.label, "Okay")
        
        
    }
    
    func testChangingSol() {
        try! setUpWithError()
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let newSolTitle = app.navigationBars["Sol 14"].staticTexts["Sol 14"]
        XCTAssertEqual(newSolTitle.label, "\(newSolTitle.label)")
    }
    
    func testViewingCellDetail() {
        try! setUpWithError()
        app.collectionViews.children(matching: .cell).element(boundBy: 3).images["imageCell"].tap()
        let photo = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        XCTAssert(photo)
    }
    
    func testLeavingDetailView() {
        try! setUpWithError()
        let solStaticText = app.navigationBars["Sol 15"].staticTexts["Sol 15"]
        solStaticText.tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 1).images["imageCell"].tap()
        let titleNavigationBar = app.navigationBars["Title"]
        titleNavigationBar.staticTexts["Title"].tap()
        titleNavigationBar.buttons["Sol 15"].tap()
        solStaticText.tap()
        XCTAssertEqual(solStaticText.label, "Sol 15")
    }
}

extension AstronomyUITests {
     override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
}


