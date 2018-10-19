//
//  PhotoCollectionPage.swift
//  AstronomyUITests
//
//  Created by Moin Uddin on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct PhotoCollectionPage: TestPage {

    //Computed Properties
    func photoFor(_ index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index)
    }
    
    // Check Sols by title being 'Sol 1', 'Sol 2', etc.
    func navigationBarTitle(solNumber: Int) -> XCUIElement {
        return app.navigationBars["Sol \(solNumber)"]
    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }

    //Actions
    @discardableResult func tapOnPhoto(_ index: Int) -> PhotoDetailPage {
        photoFor(index).tap()
        return PhotoDetailPage(testCase: testCase)
    }
    
    @discardableResult func tapNextSol() -> PhotoCollectionPage {
        testCase.expect(exists: nextSolButton, file: #file, line: #line)
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapPreviousSol() -> PhotoCollectionPage {
        testCase.expect(exists: previousSolButton, file: #file, line: #line)
        previousSolButton.tap()
        return self
    }

    //Verifications
    @discardableResult func verifySolNumber(_ solNumber: Int) -> PhotoCollectionPage {
        testCase.expect(exists: navigationBarTitle(solNumber: solNumber), file: #file, line: #line)
        return self
    }
    var testCase: XCTestCase

}
