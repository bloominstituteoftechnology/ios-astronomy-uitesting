//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jonalynn Masters on 12/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app = XCUIApplication()
    
    override func setUp() {
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
        continueAfterFailure = false
    }
    
    func testSavingAPhoto() {
        waitForPhotosToLoad()
        
        app.collectionViews.cells.element(boundBy: 0).tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssertTrue(app.alerts["Photo Saved!"].exists)
    }
    
    func testViewingNextSol() {
        waitForPhotosToLoad()
        let sol = app.navigationBars.staticTexts
        app.navigationBars.buttons.element(boundBy: 1).tap()
        let sol2 = app.navigationBars.staticTexts
        XCTAssertTrue(sol != sol2)
    }
    
    func testPhotosLoadedAreUnique() {
         waitForPhotosToLoad()
         XCTAssertFalse(app.collectionViews.cells.element(boundBy: 0).images == app.collectionViews.cells.element(boundBy: 1).images)
     }
    
    func testDifferentSolsHaveUniqueImages() {
        waitForPhotosToLoad()
        let photoIndex = 1
        let cellPhoto1 = app.collectionViews.cells.element(boundBy: photoIndex).images
        app.navigationBars.buttons.element(boundBy: 1).tap()
        waitForPhotosToLoad()
        let cellPhoto2 = app.collectionViews.cells.element(boundBy: photoIndex).images
        XCTAssertTrue(cellPhoto1 != cellPhoto2)
    }
    
    private func waitForPhotosToLoad() {
        let fetchedPhotos = expectation(for: NSPredicate(format: "count > 0"), evaluatedWith: app.collectionViews.cells.images, handler: nil)
                   fetchedPhotos.expectationDescription = "Photos have been fetched"
        
            waitForExpectations(timeout: 30)
    }
}
