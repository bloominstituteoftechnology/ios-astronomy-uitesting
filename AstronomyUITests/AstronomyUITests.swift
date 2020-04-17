//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Shawn Gee on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    // MARK: - Properties
    var app: XCUIApplication!
    
    lazy var navBarTitleLabel = app.navigationBars.firstMatch.staticTexts.firstMatch.label
    lazy var previousSolButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    lazy var nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
    
    lazy var collectionView = app.collectionViews.firstMatch
    lazy var firstCell = collectionView.cells.firstMatch
    
    // MARK: - Setup
    
    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()

        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testInitialSolTitle() throws {
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testPreviousSolButton() throws {
        previousSolButton.tap()
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "Sol 14")
    }
    
    func testNextSolButton() throws {
        nextSolButton.tap()
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "Sol 16")
    }
    
    func testNextThenPreviousSolButton() throws {
        nextSolButton.tap()
        previousSolButton.tap()
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testPreviousThenNextSolButton() throws {
        previousSolButton.tap()
        nextSolButton.tap()
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testTapFirstPhoto() throws {
        firstCell.tap()
        print("😀 navBar label: \(navBarTitleLabel)")
        XCTAssertEqual(navBarTitleLabel, "8/20/12, 8:00 PM")
    }
    
    
    

//    func testLaunchPerformance() throws {
//        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
//            // This measures how long it takes to launch your application.
//            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
//                XCUIApplication().launch()
//            }
//        }
//    }
}
