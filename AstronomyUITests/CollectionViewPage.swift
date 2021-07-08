//
//  CollectionViewPage.swift
//  AstronomyUITests
//
//  Created by Carolyn Lea on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct CollectionViewPage: TestPage
{
    let testCase: XCTestCase
    
    var previousButton: XCUIElement
    {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextButton: XCUIElement
    {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var cellImageView: XCUIElement
    {
        return app.images["ImageCollectionViewCell.imageView"]
    }
    
    var collectionCell: XCUIElement
    {
        return app.collectionViews.cells["ImageCell"]
    }
    
    var collectionView: XCUIElement
    {
        return app.collectionViews.element(boundBy: 0)
    }
    
    func collectionViewCell(at index: Int) -> XCUIElement {
        return collectionView.cells.element(boundBy: index)
    }
    
    @discardableResult func tapOnNextSol(file: String = #file, line: UInt = #line) -> CollectionViewPage
    {
        testCase.expect(exists: nextButton, file: file, line: line)
        nextButton.tap()
        return self
    }
    
    @discardableResult func tapOnPreviousSol(file: String = #file, line: UInt = #line) -> CollectionViewPage
    {
        testCase.expect(exists: previousButton, file: file, line: line)
        previousButton.tap()
        return self
    }
    
    
    @discardableResult func tapOnCollectionViewCell(at index: Int, file: String = #file, line: UInt = #line) -> DetailPage
    {
        let cell = collectionViewCell(at: index)
        print(app)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return DetailPage(testCase: testCase)
    }
    
    
}
