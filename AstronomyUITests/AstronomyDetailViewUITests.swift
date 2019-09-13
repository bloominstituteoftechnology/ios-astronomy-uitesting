//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Bradley Yin on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyDetailViewUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false

        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        
        app.launch()

    }
    
    var savePhotoButton: XCUIElement {
        let button = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssertTrue(button.exists)
        XCTAssertTrue(button.isHittable)
        return button
    }
    
    var photoCollectionView: XCUIElement {
        let collectionView = app.collectionViews.firstMatch
        XCTAssertTrue(collectionView.exists)
        return collectionView
    }
    
    var photoDetailLabel: XCUIElement {
        let label = app.staticTexts["PhotoDetailViewController.detailLabel"]
        XCTAssertTrue(label.exists)
        return label
    }
    
    var cameraLabel: XCUIElement {
        let label = app.staticTexts["PhotoDetailViewController.cameraLabel"]
        XCTAssertTrue(label.exists)
        return label
    }
    
    var cameraTypeLabel: XCUIElement {
        let label = app.staticTexts["PhotoDetailViewController.cameraTypeLabel"]
        XCTAssertTrue(label.exists)
        return label
    }
    
    var permissionAlert: XCUIElement {
        let alert = app.alerts.element
        XCTAssert(alert.exists)
        return alert
    }
    

    
    func testCell1GoToNextVC() {
        //sleep(5)
        let cell1 = photoCollectionView.children(matching: .cell).firstMatch
        
        cell1.tap()
        
        XCTAssertTrue(app.navigationBars["Title"].exists)
    }
    
    func testPhotoDetailLoadedForCell1() {
        let cell1 = photoCollectionView.children(matching: .cell).firstMatch
        
        cell1.tap()
        
        XCTAssertEqual("Taken by 5 on 8/20/12, 5:00 PM (Sol 15)", photoDetailLabel.label)
        
        XCTAssertEqual("Camera:", cameraLabel.label)
        XCTAssertEqual("Front Hazard Avoidance Camera", cameraTypeLabel.label)
        
        
    }

    func testSavingPhoto() {
        let cell1 = photoCollectionView.children(matching: .cell).firstMatch
        
        cell1.tap()
        
        savePhotoButton.tap()
        
        XCTAssertTrue(permissionAlert.isHittable) 
        
    }

}
