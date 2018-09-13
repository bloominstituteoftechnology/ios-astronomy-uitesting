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
    var previousSolButton: XCUIElement {
        let prevSolBtn = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
        testCase.expect(exists: prevSolBtn)
        return prevSolBtn
    }
    
    var nextSolButton: XCUIElement {
        let nextSolBtn = app.buttons["PhotosCollectionViewController.NextSolButton"]
        testCase.expect(exists: nextSolBtn)
        return nextSolBtn
    }
    
    func navigationBar(withTitle title: String) -> XCUIElement {
        testCase.expect(exists: app.navigationBars[title])
        return app.navigationBars[title]
    }
    
    func collectionCell(at index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
    
    // MARK: - Interactions
    // Changing sol
    @discardableResult func nextSol(file: String = #file, line: UInt = #line) -> AstronomyListPage {
        let next = nextSolButton
        testCase.expect(exists: next, file: file, line: line)
        next.tap()
        return self
    }
    
    @discardableResult func previousSol(file: String = #file, line: UInt = #line) -> AstronomyListPage {
        let prev = previousSolButton
        testCase.expect(exists: prev, file: file, line: line)
        prev.tap()
        return self
    }
    
    // MARK: - Verifications
    // Verify we're on the correct Sol
}
