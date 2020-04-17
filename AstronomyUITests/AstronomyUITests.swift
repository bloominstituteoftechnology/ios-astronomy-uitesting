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
    
    lazy var navBar = app.navigationBars.firstMatch
    lazy var navBarTitleLabel = navBar.staticTexts.firstMatch.label
    lazy var navBarLeftButton = navBar.buttons.firstMatch
    lazy var previousSolButton = app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    lazy var nextSolButton = app.buttons["PhotosCollectionViewController.NextSolButton"]
    
    lazy var collectionView = app.collectionViews.firstMatch
    lazy var firstCell = collectionView.cells.firstMatch
    
    lazy var detailLabel = app.staticTexts.matching(identifier: "detailLabel").firstMatch.label
    lazy var cameraLabel = app.staticTexts.matching(identifier: "cameraLabel").firstMatch.label
    lazy var savePhotoButton = app.buttons["Save to Photo Library"]
    
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
    
    // MARK: - Tests
    
    func testInitialSolTitle() throws {
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testPreviousSolButton() throws {
        previousSolButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 14")
    }
    
    func testNextSolButton() throws {
        nextSolButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 16")
    }
    
    func testNextThenPreviousSolButton() throws {
        nextSolButton.tap()
        previousSolButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testPreviousThenNextSolButton() throws {
        previousSolButton.tap()
        nextSolButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testTapFirstPhoto() throws {
        firstCell.tap()
        XCTAssertEqual(navBarTitleLabel, "8/20/12, 8:00 PM")
    }
    
    func testScrollCollectionView() throws {
        scroll(collectionView: collectionView, toFindCellWithId: "[0, 57]")
    }
    
    func testTapLastPhoto() throws {
        guard let lastCell = scroll(collectionView: collectionView, toFindCellWithId: "[0, 57]") else { return }
        lastCell.tap()
        XCTAssertEqual(navBarTitleLabel, "8/20/12, 8:00 PM")
    }
    
    func testDetailVCLabels() throws {
        firstCell.tap()
        XCTAssertEqual(detailLabel, "Taken by 5 on 8/20/12, 8:00 PM (Sol 15)")
        XCTAssertEqual(cameraLabel, "Front Hazard Avoidance Camera")
    }
    
    func testSavePhotoToLibrary() throws {
        firstCell.tap()
        savePhotoButton.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    func testTapFirstPhotoThenTapBack() throws {
        firstCell.tap()
        navBarLeftButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 15")
    }
    
    func testMultiStepNav() throws {
        previousSolButton.tap()
        firstCell.tap()
        navBarLeftButton.tap()
        nextSolButton.tap()
        nextSolButton.tap()
        firstCell.tap()
        navBarLeftButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 16")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    
    // MARK: - Helper Functions
    
    @discardableResult
    func scroll(collectionView:XCUIElement, toFindCellWithId identifier:String) -> XCUIElement? {
        guard collectionView.elementType == .collectionView else {
            fatalError("XCUIElement is not a collectionView.")
        }
        
        var reachedTheEnd = false
        var allVisibleElements = [String]()
        
        while !reachedTheEnd {
            let cell = collectionView.cells[identifier]
            
            // Did we find our cell ?
            if cell.exists {
                return cell
            }
            
            // If not: we store the list of all the elements we've got in the CollectionView
            let allElements = collectionView.cells.allElementsBoundByIndex.map({$0.identifier})
            
            // Did we read then end of the CollectionView ?
            // i.e: do we have the same elements visible than before scrolling ?
            reachedTheEnd = (allElements == allVisibleElements)
            allVisibleElements = allElements
            
            // Then, we do a scroll up on the scrollview
            collectionView.swipeUp()
        }
        return nil
    }
}
