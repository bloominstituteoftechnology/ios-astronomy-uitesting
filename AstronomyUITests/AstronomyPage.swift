//
//  AstronomyPageTests.swift
//  AstronomyUITests
//
//  Created by De MicheliStefano on 13.09.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct AstronomyPage: TestPage {
    var testCase: XCTestCase
    
    // MARK: - Elements
    
    // CollectionView
    
    func collectionViewCell(for index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
    
    var collectionViewCells: XCUIElementQuery {
        return app.collectionViews.cells
    }
    
//    func solLabel(for number: Int) -> String {
//        return app.navigationBars.element(boundBy:0).title
//    }
    
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var solLabel: String {
        return app.navigationBars.element(boundBy: 0).identifier
    }
    
    // DetailView
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var detailImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var takenByLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.TakenByLabel"]
    }
    
    var photoSavedAlertLabel: String {
        return app.alerts.element(boundBy: 0).label
    }
    
    // MARK: - Actions (interactions)
    
    // CollectionView
    
    @discardableResult func tapOnNextSolButton(file: String = #file, line: UInt = #line) -> AstronomyPage {
        let button = nextSolButton
        button.tap()
        return self
    }
    
    @discardableResult func tapOnPreviousSolButton(file: String = #file, line: UInt = #line) -> AstronomyPage {
        let button = previousSolButton
        button.tap()
        return self
    }
    
    @discardableResult func tapOnCollectionViewCell(at index: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
        let cell = collectionViewCell(for: index)
        testCase.expect(exists: cell)
        cell.tap()
        return self
    }
    
    // DetailView
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> AstronomyPage {
        saveButton.tap()
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifyViewingNextSol(after currentSol: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
        let solLabel = self.solLabel
        testCase.expect(solLabel, equals: "Sol \(currentSol + 1)")
        return self
    }
    
    @discardableResult func verifyViewingPreviousSol(after currentSol: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
        let solLabel = self.solLabel
        testCase.expect(solLabel, equals: "Sol \(currentSol - 1)")
        return self
    }
    
    @discardableResult func verifyTapOnViewCell(at index: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
        tapOnCollectionViewCell(at: index)
        return self
    }
    
    @discardableResult func verifySavePhoto(at index: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
        tapOnCollectionViewCell(at: index)
        tapOnSaveButton()
        testCase.expect(photoSavedAlertLabel, equals: "Photo Saved!")
        return self
    }
    
//    @discardableResult func verifyCollectionViewCellImage(at index: Int, file: String = #file, line: UInt = #line) -> AstronomyPage {
//        let cell = collectionViewCell(for: index).images
//        return self
//    }
    
}
