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
    
    func testScrollCollectionView() throws {
        scroll(collectionView: collectionView, toFindCellWithId: "[0, 57]")
    }
    
    
    
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
    
    
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
            let startCoordinate = collectionView.coordinate(withNormalizedOffset: CGVector(dx: 0.99, dy: 0.9))
            startCoordinate.press(forDuration: 0.01, thenDragTo: collectionView.coordinate(withNormalizedOffset:CGVector(dx: 0.99, dy: 0.1)))
        }
        return nil
    }
}
