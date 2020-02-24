//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kenny on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    //=======================
    // MARK: - Types
    enum Identifier: String {
        case savePhotoButton = "PhotoDetailViewController.SaveButton"
        case nextSolButton = "PhotosCollectionViewController.NextSolButton"
        case previousSolButton = "PhotosCollectionViewController.PreviousSolButton"
        case solDetailLabel = "PhotoDetailViewController.SolDetailLabel"
        case cameraLabel = "PhotoDetailViewController.CameraLabel"
        case photoCellImageView = "PhotosCollectionViewController.ImageCell.ImageView"
        case detailVCImageView = "PhotoDetailViewController.ImageView"
    }
    
    //=======================
    // MARK: - Properties
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private func button(withId id: Identifier) -> XCUIElement {
        return app.buttons[id.rawValue]
    }
    
    private func label(withId id: Identifier) -> XCUIElement {
        return app.staticTexts[id.rawValue]
    }
    
    private func imageView(withId id: Identifier) -> XCUIElement {
        return app.images[id.rawValue]
    }
    
    private var savePhotoButton: XCUIElement {
        return button(withId: .savePhotoButton)
    }
    
    private var nextSolButton: XCUIElement {
        return button(withId: .nextSolButton)
    }
    
    private var previousSolButton: XCUIElement {
        return button(withId: .previousSolButton)
    }
    
    private var solDetailLabel: XCUIElement {
        return label(withId: .solDetailLabel)
    }
    
    private var cameraLabel: XCUIElement {
        return label(withId: .cameraLabel)
    }
    
    private var cellImageView: XCUIElement {
        return imageView(withId: .photoCellImageView)
    }
    
    private var detailVCImageView: XCUIElement {
        return imageView(withId: .detailVCImageView)
    }
    
    private var firstCell: XCUIElement {
        return app.cells.element(boundBy: 0)
    }
    
    private var solDescription: XCUIElement?
    
    //=======================
    // MARK: - Setup Test Environment
    override func setUp() {
        app.launch()
        continueAfterFailure = false
        solDescription = solDetailLabel
    }
    
    //=======================
    // MARK: - Tests
    func testCellImageViewNotNil() {
        XCTAssertNotNil(cellImageView)
    }
    
    func testViewPreviousSol() {
        XCTAssert(previousSolButton.isHittable)
        previousSolButton.tap()
        XCTAssert(solDetailLabel != solDescription)
    }
    
    func testViewNextSol() {
        //let solDescription = solDetailLabel
        XCTAssert(nextSolButton.isHittable)
        nextSolButton.tap()
        XCTAssert(solDetailLabel != solDescription)
    }
    
    func testDetailViewHasImage() {
        firstCell.tap()
        XCTAssert(detailVCImageView.exists)
    }
    
    func testSavingPhoto() {
        firstCell.tap()
        XCTAssert(savePhotoButton.isHittable)
        savePhotoButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
}
