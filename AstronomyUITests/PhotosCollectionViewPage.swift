//
//  PhotosCollectionViewPage.swift
//  AstronomyUITests
//
//  Created by Jason Modisett on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotosCollectionViewPage: TestPage {
    
    // MARK:- Accessibility identifiers enum
    
    enum Identifiers {
        static let prevSolButton = "PhotosCollectionViewController.PreviousSolButton"
        static let nextSolButton = "PhotosCollectionViewController.NextSolButton"
        static let navBar = "PhotosCollectionViewController.NavigationBar"
    }
    
    var testCase: XCTestCase
    
    // MARK:- UI elements
    
    var previousSolButton: XCUIElement { return app.buttons[Identifiers.prevSolButton] }
    var nextSolButton: XCUIElement { return app.buttons[Identifiers.nextSolButton] }
    var solDayLabel: String { return app.navigationBars[Identifiers.navBar].otherElements.firstMatch.label }
    
    private func cell(_ index: Int) -> XCUIElement { return app.collectionViews.element(boundBy: index) }
    
    
    // MARK:- Interactions
    
    @discardableResult func tapOnCell(with index: Int) -> PhotoDetailViewPage {
        
        let _cell = cell(index)
        XCTAssertNotNil(_cell, "Cell at index \(index) is nil")
        
        _cell.tap()
        
        return PhotoDetailViewPage(testCase: testCase, photosCollectionViewPage: self)
    }
    
    @discardableResult func tapPreviousSol() -> PhotosCollectionViewPage {
        
        let currentSol = solDayLabel
        
        previousSolButton.tap()
        verifySolHasChanged(with: currentSol)
        
        return self
    }
    
    @discardableResult func tapNextSol() -> PhotosCollectionViewPage {
        
        let currentSol = solDayLabel
        
        nextSolButton.tap()
        verifySolHasChanged(with: currentSol)
        
        return self
    }
    
    
    // MARK:- Verifications
    
    @discardableResult private func verifySolHasChanged(with comparedSolLabel: String) -> PhotosCollectionViewPage {
        
        XCTAssertNotEqual(solDayLabel, comparedSolLabel)
        
        return self
    }
}
