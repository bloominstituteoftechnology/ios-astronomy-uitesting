//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_34 on 3/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    //MARK: - Properties
    var app: XCUIApplication!
    
    var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var backButton: XCUIElement {
        return app.navigationBars.buttons.element(boundBy: 0)
    }
    
    var alertButton: XCUIElement {
        return app.alerts["Photo Saved!"].buttons["Okay"]
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews.element
    }
    
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
    }
    
    private func cellAt(_ index: Int) -> XCUIElement {
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: index)
        return cell
    }
    
    func testSavingAPhotoFromDetailViewButton() {
        // check that image is present.
        cellAt(0).tap()
        savePhotoButton.tap()
        alertButton.tap()
    }
    
    func testViewingAnotherSolAfterButton() {
        // check sol position
        nextSolButton.tap()
        previousSolButton.tap()
        previousSolButton.tap()
        nextSolButton.tap()
    }
    
    func testBackButtonTappedInDetailView() {
        // check that navbar title is collectionview sol title.
        cellAt(0).tap()
        backButton.tap()
    }
}
