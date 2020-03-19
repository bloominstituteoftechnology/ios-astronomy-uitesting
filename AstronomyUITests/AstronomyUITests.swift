//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Chris Gonzales on 3/19/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
//@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    // MARK: - Properties
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews.element(boundBy: 0)
    }

    // MARK: - Private Methods
    
    private func collectionViewCell(at index: Int) -> XCUIElement {
        return collectionView.cells.element(boundBy: index)
    }
    
    // MARK: - Accessibility Labels
    
    //Photo Collection View Controller Labels
    private var planetsCollectionImageView: XCUIElement {
        return app.images["PhotoCollectionViewController.ImageView"]
    }
    private var planetsView: XCUIElement {
        return app.staticTexts["PhotosCollectionViewController.View"]
    }
    private var nextSolButton: XCUIElement {
        return app.buttons["NextSolButton"]
    }
    
    //Photo Detail View Controller Labels
    private var photoImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    private var photoDetailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.PhotoDetailLabel"]
    }
    private var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    // MARK: - Setup
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
    }
    
    // MARK: - Test Methods
    
    func testTapCell() {
        transitionToDetailVC()
    }
    
    func testSaveConfirmed() {
        transitionToDetailVC()
        XCTAssertTrue(saveButton.exists)
        saveButton.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
    
    func testTapBack() {
        transitionToDetailVC()
        let backButton = app.navigationBars["Title"].buttons["Sol 1"]
        backButton.tap()
    }
    
    func testForwardTapped() {
        checkCollectionVC()
        XCTAssertEqual(collectionView.title, "Sol 1")
        XCTAssertTrue(nextSolButton.isHittable)
        nextSolButton.tap()
        XCTAssertEqual(collectionView.title, "Sol 2")
        checkCollectionVC()
    }
    
    // MARK: - Helper Methods
    
    func checkCollectionVC() {
        let testCell = collectionViewCell(at: 0)
        let dataFetchedExpectation = expectation(description: "Waiting for cell photo")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if testCell.exists {
                dataFetchedExpectation.fulfill()
            } else {
                print("⚠️ Something went wrong fetching cell data")
            }
        }
        
        wait(for: [dataFetchedExpectation], timeout: 3)
        
        XCTAssertTrue(testCell.exists)
    }
    
    func transitionToDetailVC() {
        let testCell = collectionViewCell(at: 0)
        let dataFetchedExpectation = expectation(description: "Waiting for cell photo")
        let photoFetchedExpectation = expectation(description: "Waiting for detail view photo")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if testCell.exists {
                dataFetchedExpectation.fulfill()
            } else {
                print("⚠️ Something went wrong fetching cell data")
            }
        }
        
        wait(for: [dataFetchedExpectation], timeout: 3)
        
        XCTAssertTrue(testCell.exists)
        
        testCell.tap()

        XCTAssertTrue(saveButton.exists)
        XCTAssertTrue(photoDetailLabel.exists)
        XCTAssertTrue(cameraLabel.exists)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            if self.photoImageView.exists {
                photoFetchedExpectation.fulfill()
            } else {
                print("⚠️ Something went wrong fetching image data")
            }
            
        }
        
        wait(for: [photoFetchedExpectation], timeout: 3)
        
        XCTAssertTrue(photoImageView.exists)
    }
}
