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
    
    
    // MARK:- Interactions
    
    @discardableResult func tapOnSavePhotoButton() -> DetailPage {
        saveToPhotoLibraryButton.tap()
        return self
    }
    
    // MARK:- Verifications
    
//    @discardableResult func verifyPhotoWasSaved() -> DetailPage {
//        //show alert controller
//    }
    
}
