//
//  PhotosCollectionPage.swift
//  AstronomyUITests
//
//  Created by Ilgar Ilyasov on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct PhotosCollectionPage: TestPage {
    
    var testCase: XCTestCase
    
    // UI Elements
    var previousSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    @discardableResult func navigationItemTitle(for index: Int) -> XCUIElement {
        return app.navigationBars.staticTexts["Sol \(index)"]
    }
    
    @discardableResult func imageView(on index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageView").firstMatch
//        return app.collectionViews.cells.images["PhotosCollectionViewController.ImageView"]
    }
    
    // Actions
    
    @discardableResult func tapOnLeftBarButton() -> PhotosCollectionPage {
        previousSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnRightBarButton() -> PhotosCollectionPage {
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnImageView(index: Int, file: String, line: UInt) -> PhotoDetailPage {
        imageView(on: index)
        return PhotoDetailPage(testCase: testCase)
    }
    
    // Verifications

}
