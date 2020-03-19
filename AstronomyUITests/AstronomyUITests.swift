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
    
    override func setUp() {
       
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
        
    }
    
    func testViewingAnotherSol() {
        XCTAssert(rightBarButtonItem.isHittable)
        rightBarButtonItem.tap()
        XCTAssertTrue(imagePhotoCell.exists)
    }
    
    
     func testSavingPhoto() {
        firstCell.tap()
        XCTAssert(savePhotoButton.isHittable)
        savePhotoButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
    
    
    
    
    
    

}
