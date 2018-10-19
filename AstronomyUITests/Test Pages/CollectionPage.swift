//
//  CollectionPage.swift
//  AstronomyUITests
//
//  Created by Madison Waters on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct CollectionPage: TestPage {
    
    // UI Elements
    //NavigationBar, 0x6000013b62f0, {{0.0, 44.0}, {414.0, 44.0}}, identifier: 'Sol 1'
    //Button, 0x6000013b63c0, {{12.0, 44.0}, {22.0, 44.0}}, identifier: 'PhotosCollectionViewController.PreviousSolButton', label: '<'
    //Button, 0x6000013b6560, {{383.0, 44.0}, {19.0, 44.0}}, identifier: 'PhotosCollectionViewController.NextSolButton', label: '>'
    // CollectionView // Cell
    //Image, 0x6000013b6b10, {{10.0, 88.0}, {192.0, 192.0}}, identifier: 'PhotoCollectionViewController.ImageView'
    
    // PhotoCollectionViewController.ImageView
    // Getting the Cell
    var collectionView: XCUIElement {
        return app.collectionViews.element(boundBy: 1)
    }
    
    @discardableResult func collectionViewCell(at index: Int) -> XCUIElement {
        return collectionView.cells.element(boundBy: index)
    }
    
    // "PhotosCollectionViewController.PreviousSolButton"
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    // "PhotosCollectionViewController.NextSolButton"
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var sol14Button: XCUIElement {
        return app.navigationBars["Title"].buttons["Sol 14"]
    }
    
    var sol15Button: XCUIElement {
        return app.navigationBars["Title"].buttons["Sol 15"]
    }
    
    var sol16Button: XCUIElement {
        return app.navigationBars["Title"].buttons["Sol 16"]
    }
    
    // Mark: - Hard coded Identifiers
    
    // PhotosCollectionViewController.SolLabel
    var solLabel: XCUIElement {
        return app.staticTexts["PhotosCollectionViewController.SolLabel"]
    }
    //PhotosCollectionViewController
    var collectionViewlabel: XCUIElement {
        return app.collectionViews["PhotosCollectionViewController"]
    }
    
    // (Inter)Actions
    
    // Previous Sol Button
    @discardableResult func previousSolButtonTap() -> CollectionPage {
        
        previousSolButton.tap()
        XCTAssertEqual(previousSolButton.label, "<")
        return self
    }
    
    // Previous Sol Button
    @discardableResult func nextSolButtonTap() -> CollectionPage {
        
        nextSolButton.tap()
        XCTAssertEqual(nextSolButton.label, ">")
        return self
    }
    
    // Verifications
    // Verify Previous Sol Button
    
    @discardableResult func verifySolLabels() -> CollectionPage {
        
        XCTAssertEqual(sol15Button.title, "Sol 1")
        return self
        
    }
    
    @discardableResult func verifySol15Label() -> CollectionPage {
        
        XCTAssertEqual(sol15Button.title, "Sol 15")
        return self
        
    }
    
    //Verify that photo tapped on in the table view is the same one displayed in the detail view
    
    
    
    var testCase: XCTestCase
}

//Computed properties for every element (that you care about). This also includes adding Accessibility Identifiers to those elements where applicable. NOTE: accessibility identifiers have already been added to the previous sol (<) and next sol (>) bar button items that get created programmatically
//Actions (or interactions) that you can take using the elements you just made computed properties for.
//    Verifications that will test for expected behavior.
//Create a test for every interaction you can think of. To get you started:
//
//Test saving a photo
//Test viewing another sol (Note that since you're using local data, there will only be 3 sols (sols 14-16)
//You should be able to write at least 4 tests. If you're stumped on tests to write, it can be helpful to think about how a normal user would interact with the app.
