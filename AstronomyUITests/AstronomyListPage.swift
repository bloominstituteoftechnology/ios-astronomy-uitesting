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
    func navigationBar(withTitle title: String) -> XCUIElement {
        testCase.expect(exists: app.navigationBars[title])
        return app.navigationBars[title]
    }
    
    func collectionCell(at index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
    
    // MARK: - Interactions
    // Changing sol
    
    // MARK: - Verifications
    // Verify we're on the correct Sol
}
