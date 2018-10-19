//
//  PhotoDetailPage.swift
//  AstronomyUITests
//
//  Created by Moin Uddin on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct PhotoDetailPage: TestPage {
    
    //Computed Properties
    
    var detailPhoto: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var alertMessage: XCUIElement {
        return app.alerts["Photo Saved!"]
    }
    
    //Actions
    @discardableResult func tapSaveButton() -> PhotoDetailPage {
        saveButton.tap()
        return self
    }
    
    //Verifications
    
    @discardableResult func verifyPhoto() -> PhotoDetailPage {
        testCase.expect(exists: detailPhoto, file: #file, line: #line)
        return self
    }
    
    @discardableResult func verifyPhotoSaved() -> PhotoDetailPage {
        testCase.expect(exists: alertMessage, file: #file, line: #line)
        return self
    }
    
    var testCase: XCTestCase
    
}

