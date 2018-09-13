//
//  AstronomyPage.swift
//  AstronomyUITests
//
//  Created by Conner on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct AstronomyListPage: TestPage {
    let testCase: XCTestCase
    
    // MARK: - Elements
    // Available images
    
    // MARK: - Interactions
    // Clicking on a image (to go to detail view)
    @discardableResult func tapOnImage(cell: XCUIElement, file: String = #file, line: UInt = #line) -> AstronomyListPage {
        return self
    }
    // Changing sol
    
    // MARK: - Verifications
    // Verify we're on the correct Sol
}
