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
    // Going back
    @discardableResult func tapOnBackButton(with label: String, file: String = #file, line: UInt = #line) -> AstronomyDetailPage {
        let button = app.buttons[label]
        testCase.expect(exists: button, file: file, line: line)
        button.tap()
        return self
    }
    
    // Verifications
    // Saved to photo library
}
