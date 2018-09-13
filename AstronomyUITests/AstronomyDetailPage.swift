//
//  AstronomyDetailPage.swift
//  AstronomyUITests
//
//  Created by Conner on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct AstronomyDetailPage: TestPage {
    let testCase: XCTestCase
    
    // Elements
    var detailLabel: XCUIElement {
        let detailLabel = app.staticTexts["PhotoDetailViewController.DetailLabel"]
        testCase.expect(exists: detailLabel)
        return detailLabel
    }
    
    var cameraLabel: XCUIElement {
        let cameraLabel = app.staticTexts["PhotoDetailViewController.CameraLabel"]
        testCase.expect(exists: cameraLabel)
        return cameraLabel
    }
    
    // Interactions
    // Saving to photo library
    
    // Verifications
    // Saved to photo library
}
