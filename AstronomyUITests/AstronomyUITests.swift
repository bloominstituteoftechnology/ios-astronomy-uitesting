//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Austin Cole on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        let app = XCUIApplication()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() {
        
        
        
    }
    func testSelectingCellToGoToDetailView() {
        let fetchPhotosExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.collectionViews.cells, handler: nil)
        fetchPhotosExpectation.expectationDescription = "Photos should have been fetched and displayed on the collectionView."
        waitForExpectations(timeout: 5, handler: nil)
        PhotosCollectionViewPage(testCase: self)
        .tapOnCell(index: 0)
        PhotoDetailViewPage(testCase: self)
        .verifyCameraLabelHasAdequateText()
        .verifyImageViewHasImage()
        .verifyDetailLableHasAdequateText()
    }
    func testSavingPhoto() {
        let fetchPhotosExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.collectionViews.cells, handler: nil)
        fetchPhotosExpectation.expectationDescription = "Photos should have been fetched and displayed on the collectionView."
        waitForExpectations(timeout: 5, handler: nil)
        PhotosCollectionViewPage(testCase: self)
        .tapOnCell(index: 5)
        PhotoDetailViewPage(testCase: self)
        .tapOnSaveButton()
        .tapOnPhotoAlertOkayButton()
    }
    func testChangingToNextSol() {
        PhotosCollectionViewPage(testCase: self)
        .verifyNextSolButtonLabelChanges(sol: 0)
    }
    func testChangingToPreviousSol() {
        PhotosCollectionViewPage(testCase: self)
            .verifyPreviousSolButtonLabelChanges(sol: 0)
    }
    func testNavItemTitleChanges() {
        let fetchPhotosExpectation = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.collectionViews.cells, handler: nil)
        fetchPhotosExpectation.expectationDescription = "Photos should have been fetched and displayed on the collectionView."
        
        PhotosCollectionViewPage(testCase: self)
            .verifyNextSolButtonLabelChanges(sol: 0)
            waitForExpectations(timeout: 5, handler: nil)
        PhotosCollectionViewPage(testCase: self)
        .verifyPreviousSolButtonLabelChanges(sol: 1)
    }
    let app = XCUIApplication()
}
