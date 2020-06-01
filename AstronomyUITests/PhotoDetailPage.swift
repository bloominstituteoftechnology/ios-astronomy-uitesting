//
//  PhotoDetailPage.swift
//  AstronomyUITests
//
//  Created by Lisa Sampson on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoDetailPage: TestPage {
    var testCase: XCTestCase
    
    // MARK: - Elements
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    // MARK: - Actions
    
    @discardableResult func tapOnSave(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        testCase.expect(exists: saveButton, file: file, line: line)
        saveButton.tap()
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifySaveWorks(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        tapOnSave()
        return self
    }
    
}
