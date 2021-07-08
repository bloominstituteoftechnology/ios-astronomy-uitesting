//
//  DetailPage.swift
//  AstronomyUITests
//
//  Created by Carolyn Lea on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct DetailPage: TestPage
{
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    
    
    var imageView:XCUIElement
    {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var detailLabel: XCUIElement
    {
        return app.staticTexts["PhotoDetailViewController.DetailLabel"]
    }
    
    var saveToPhotoLibraryButton: XCUIElement
    {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> DetailPage
    {
        testCase.expect(exists: saveToPhotoLibraryButton, file: file, line: line)
        saveToPhotoLibraryButton.tap()
        return self
    }
    
    
    
    // MARK: - Verifications
    
    @discardableResult func verifyImageExists(file: String = #file, line: UInt = #line) -> DetailPage
    {
        testCase.expect(exists: imageView, file: file, line: line)
        XCTAssert(imageView.exists)
        return self 
    }
    
    
    
}
