//
//  SolCollectionPage.swift
//  AstronomyUITests
//
//  Created by Daniela Parra on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct SolCollectionPage: TestPage {
    
    var sol: Int = 15
    
    // Elements
    
    private func cell(_ index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index)
    }
    
    private var previousButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }

    private var nextButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    /// Only use sols 14, 15 & 16 for testing
    private func titleLabel(for sol: Int) ->  XCUIElement {
        return app.navigationBars["Sol \(sol)"]
    }
//
//    private var sol14Label: XCUIElement {
//        return app.navigationBars["Sol 15"]
//    }

    // Interactions
    
    //Tap a cell
    
    @discardableResult func tapOnCell(_ index: Int) -> SolDetailPage {
        cell(index).tap()
        return SolDetailPage(sol: self.sol, solCollectionPage: self, testCase: self.testCase)
    }
    
    //Tap next button
    @discardableResult func tapNextButton() -> SolCollectionPage {
        nextButton.tap()
        return self
    }

    //Tap previous button
    @discardableResult func tapPreviousButton() -> SolCollectionPage {
        previousButton.tap()
        return self
    }

    // Verifications
    
    //Title displays info for sol.
    @discardableResult func verifyTitle(for sol: Int, file: String, line: UInt) -> SolCollectionPage {
        let title = titleLabel(for: sol)
        testCase.expect(exists: title, file: file, line: line)
        return self
    }
    
    //Shows images in cells.
    
    @discardableResult func verifyImageExistsInCell(_ index: Int, for sol: Int, file: String, line: UInt) -> SolCollectionPage {
        let cell = self.cell(index)
        testCase.expect(exists: cell.images["PhotosCollectionViewController.ImageView"], file: file, line: line)
        return self
    }
    
    var testCase: XCTestCase
}
