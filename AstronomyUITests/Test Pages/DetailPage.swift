//
//  DetailPage.swift
//  AstronomyUITests
//
//  Created by Madison Waters on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct DetailPage: TestPage {
    
    // UI Elements
    
    // Do these
    // PhotoDetailViewController.ImageView
    var photoDetailImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    //PhotoDetailViewController.SaveButton
    var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SavePhotoButton"]
    }
    
    // Extras
    // PhotoDetailViewController.ImageDetailLabel
    var imageDetailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.ImageDetailLabel"]
    }
    
    // PhotoDetailViewController.CameraLabel
    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
   
    // (Inter)Actions
    
    // Saving a Photo
    @discardableResult func savePhotoButtonTap() -> CollectionPage {
        
//        app.collectionViews.element(boundBy: 0)
//        savePhotoButton.tap()
//        return CollectionPage
    }
    
    // Verifications
    XCTAssert(app.staticTexts["Volley"].exists)
    
    var testCase: XCTestCase
}
//Computed properties for every element (that you care about). This also includes adding Accessibility Identifiers to those elements where applicable. NOTE: accessibility identifiers have already been added to the previous sol (<) and next sol (>) bar button items that get created programmatically
//Actions (or interactions) that you can take using the elements you just made computed properties for.
//    Verifications that will test for expected behavior.
//Create a test for every interaction you can think of. To get you started:
//
//Test saving a photo
//Test viewing another sol (Note that since you're using local data, there will only be 3 sols (sols 14-16)
//You should be able to write at least 4 tests. If you're stumped on tests to write, it can be helpful to think about how a normal user would interact with the app.
