//
//  PhotoPage.swift
//  AstronomyUITests
//
//  Created by Linh Bouniol on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotosCollectionViewPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    // PhotosCollectionViewController - previousSolButton, nextSolButton, image view, collection view cell, navigation bar title
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    // There are many cells, instead of creating a computed variable for each cell at a given index, we create a function that will return a cell at any index we're taping on.
    func collectionCell(at index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
        //app.collectionViews.children(matching: .cell).element(boundBy: index)
    }
    
//    func solTitle(with number: Int) -> XCUIElement {
//        return app.navigationBars.staticTexts["Sol\(number)"]
//    }
    
    func navigationBar(withTitle title: String) -> XCUIElement {
        return app.navigationBars[title]
        //app.navigationBars["Sol 1"]
    }
    
    // MARK: - Actions (Interactions)
    
    // PhotosCollectionViewController
    
    @discardableResult func tapOnPreviousSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        
        // Make sure previousSolButton exists
        testCase.expect(exists: previousSolButton, file: file, line: line)
        previousSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnNextSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        
        testCase.expect(exists: nextSolButton, file: file, line: line)
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnCollectionCell(at index: Int, file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        
        // Get cell
        let cell = collectionCell(at: index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return PhotoDetailViewPage(testCase: testCase)
    }
    
    // MARK: - Verifications
    
    // verify title
    @discardableResult func verifyTitle(title: String, file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        
        testCase.expect(exists: navigationBar(withTitle: title), file: file, line: line)
        return self
    }
}
