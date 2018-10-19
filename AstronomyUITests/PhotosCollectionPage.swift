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
    
    // MARK: - UI Elements
    var previousSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var cell: XCUIElement {
        return app.collectionViews.cells.element
    }
    
    @discardableResult func navigationItemTitle(for index: Int) -> XCUIElement {
        return app.navigationBars.staticTexts["Sol \(index)"]
    }
    
    @discardableResult func imageView(on index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index).otherElements.containing(.image, identifier:"PhotosCollectionViewController.ImageView").element
//        return app.collectionViews.cells.images["PhotosCollectionViewController.ImageView"]
    }
    
    // MARK: - Actions
    
    @discardableResult func tapOnLeftBarButton() -> PhotosCollectionPage {
        previousSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnRightBarButton() -> PhotosCollectionPage {
        nextSolButton.tap()
        return self
    }
    
    @discardableResult func tapOnImageView(index: Int, file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        imageView(on: index).tap()
        return PhotoDetailPage(testCase: testCase)
    }
    
    @discardableResult func tapOnCell(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        cell.tap()
        return PhotoDetailPage(testCase: testCase)
    }
    
    // MARK: - Verifications
    
    // File and Line is for Error messages. That will say which file and line cause the error
    @discardableResult func verifySolChanged(index: Int, file: String = #file, line: UInt = #line) -> PhotosCollectionPage {
        testCase.expect(false: navigationItemTitle(for: index).exists)
        return self
    }
}
