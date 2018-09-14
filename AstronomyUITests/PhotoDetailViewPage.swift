//
//  PhotoDetailViewPage.swift
//  AstronomyUITests
//
//  Created by Linh Bouniol on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoDetailViewPage: TestPage {

    let testCase: XCTestCase
    
    // MARK: - Elements
    
    var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var alertController: XCUIElement {
        return app.alerts.element(boundBy: 0)
    }
    
    // MARK: - Actions (Interactions)
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        
        testCase.expect(exists: saveButton, file: file, line: line)
        saveButton.tap()
        return self
    }
    
    // MARK: - Verifications
    
    // For save button to work, it works when the alert shows up. Verify alert shows up
    @discardableResult func verifyAlertShowsUp(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        
        testCase.expect(exists: alertController, file: file, line: line)
        return self
    }
    
    // verify image
    @discardableResult func verifyImage(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        
        testCase.expect(exists: imageView, file: file, line: line)
        return self
    }
}


