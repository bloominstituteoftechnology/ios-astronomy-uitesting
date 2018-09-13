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
    
    var titleLabel: XCUIElement
    {
        return app.staticTexts[""]
    }
    
    var imageView:XCUIElement
    {
        return app.images[""]
    }
    
    var detailLabel: XCUIElement
    {
        return app.staticTexts[""]
    }
    
    var saveToPhotoLibraryButton: XCUIElement
    {
        return app.buttons["GameViewController.RestartButton"]
    }
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> DetailPage
    {
        return self
    }
    
    @discardableResult func tapOnNextSol(file: String = #file, line: UInt = #line) -> DetailPage
    {
        return self 
    }
    // MARK: - Verifications
    
    
    
    
    
}
