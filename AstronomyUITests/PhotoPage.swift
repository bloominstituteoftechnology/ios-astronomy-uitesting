//
//  PhotoPage.swift
//  AstronomyUITests
//
//  Created by Farhan on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct PhotoPage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK:- UI Elements
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }

    func cellAt(_ index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index)
    }
    
    // MARK:- Interactions
    
    @discardableResult func tapOnNextSol() -> PhotoPage{
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnPreviousSol() -> PhotoPage {
        previousSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnVisibleCell() -> DetailPage {
    
        if cellAt(0).isHittable {
            cellAt(0).tap()
        }
        return DetailPage(testCase: testCase)
    }
    
    @discardableResult func tryScroll() -> PhotoPage {
        
        app.swipeUp()
        return self
    }
    
    // MARK:- Verifications
    
//    @discardableResult func verify
    
    @discardableResult func verifyImagesDisplayedInCells() -> PhotoPage {
        
       let cells = app.collectionViews.cells.allElementsBoundByIndex
        
        for cell in cells {
            
            if cell.isHittable {
                assert(cell.images.allElementsBoundByIndex.count == 1)
            }
        }
        return self
    }
    
    
}
