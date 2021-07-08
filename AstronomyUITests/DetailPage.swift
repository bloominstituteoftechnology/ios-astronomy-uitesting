//
//  DetailPage.swift
//  AstronomyUITests
//
//  Created by Farhan on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct DetailPage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK:- Elements

    var saveToPhotoLibraryButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var savePhotoAlert: XCUIElement {
        return app.alerts.allElementsBoundByIndex.first!
    }
    
    var OKToSaveButton: XCUIElement {
        return (app.alerts.allElementsBoundByIndex.first?.buttons.allElementsBoundByIndex.first!)!
    }
    
    
    // MARK:- Interactions
    
    @discardableResult func tapOnSavePhotoButton() -> DetailPage {
        saveToPhotoLibraryButton.tap()
        return self
    }
    
    @discardableResult func tapOnOKToSaveButton() -> DetailPage {
        OKToSaveButton.tap(); return self
    }
    
    // MARK:- Verifications
    
    @discardableResult func verifyPhotoAlertAppears() -> DetailPage {
        // assert that alert controller exists
        
        testCase.expect(exists: savePhotoAlert)
        return self
        
    }
    
}
