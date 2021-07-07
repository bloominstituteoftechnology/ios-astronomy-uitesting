//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ciara Beitel on 10/10/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    // MARK: - Helper Properties
    
    var app: XCUIApplication!
    
//    private var app: XCUIApplication {
//        return XCUIApplication()
//    }
    
    private var saveToPhotoLibraryButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var alert: XCUIElement {
        return app.alerts.element
    }

    override func setUp() {
        app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testClickingCell() {
        let collectionView = app.collectionViews.firstMatch
        let firstCell = collectionView.cells.firstMatch
        firstCell.tap()
        XCTAssertEqual(app.staticTexts["PhotoDetailViewController.detailLabel"].label, "Taken by 5 on 8/20/12, 8:00 PM (Sol 15)")
        XCTAssertEqual(app.staticTexts["PhotoDetailViewController.cameraLabel"].label, "Front Hazard Avoidance Camera")
    }
    
    func testSavingPhoto() {
        let collectionView = app.collectionViews.firstMatch
        let firstCell = collectionView.cells.firstMatch
        firstCell.tap()
        saveToPhotoLibraryButton.tap()
        XCTAssertTrue(alert.exists)
    }
    
    func testViewingNextSol() {
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "Sol 15")
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "Sol 16")
    }
    
    func testViewingPreviousSol() {
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "Sol 15")
        app.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertEqual(app.navigationBars.firstMatch.identifier, "Sol 14")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
