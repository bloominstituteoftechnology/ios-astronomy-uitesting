//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Nick Nguyen on 3/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy
class AstronomyUITests: XCTestCase {

   private let app = XCUIApplication()
    
    private var firstCell: XCUIElement {
        return app.cells.element(boundBy: 0)
    }
    
    private var imagePhotoCell: XCUIElement {
        return app.images["PhotoCollectionVC.ImageView"]
    }
    
    private var savePhotoButton: XCUIElement {
        return  app.buttons["Button"]
    }
    
    private var rightBarButtonItem: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var leftBarButtonItem: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    private var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailController.DetailLabel"]
    }
    
    private var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailController.CameraLabel"]
    }
    
    private var detailImageview: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    private var backButton: XCUIElement {
        return app.buttons.element(boundBy: 0)
    }
    
    override func setUp() {
       
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
        
    }
    
    func testViewNextSol() {
        XCTAssert(rightBarButtonItem.isHittable)
        rightBarButtonItem.tap()
        XCTAssertTrue(imagePhotoCell.exists)
    }
    
    func testViewPrevSol() {
        XCTAssertNotEqual(app.navigationBars.staticTexts.firstMatch.label, "Sol 0")
        XCTAssert(leftBarButtonItem.isHittable)
        leftBarButtonItem.tap()
        XCTAssertTrue(imagePhotoCell.exists)
      
    }
    
     func testSavingPhoto() {
        firstCell.tap()
        XCTAssert(savePhotoButton.isHittable)
        savePhotoButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
    func testFirstLaunch() {
        XCTAssertTrue(app.navigationBars.staticTexts.firstMatch.label.count != 0)
        XCTAssertTrue(rightBarButtonItem.isEnabled)
        XCTAssertTrue(leftBarButtonItem.isEnabled)
    
    }
    
    
    func testDetailScene() {
        firstCell.tap()
        XCTAssert(detailImageview.exists)
        XCTAssertTrue(savePhotoButton.isEnabled)
        XCTAssertEqual(savePhotoButton.label,"Save to Photo Library")
        XCTAssertTrue(detailLabel.label.count != 0)
    }
    
    func testGoFromDetailSceneToMainScene() {
        firstCell.tap()
        backButton.tap()
        XCTAssert(imagePhotoCell.exists)
        XCTAssertTrue(app.navigationBars.staticTexts.firstMatch.label.count != 0)
    }
    


}
