//
//  SolPage.swift
//  AstronomyUITests
//
//  Created by Benjamin Hakes on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

struct SolPage: TestPage {
    
    let testCase: XCTestCase
    
    // MARK: - Elements
    
    /// - Requires: The value of the index should be from 0 to 8.
    private func cellFor(_ item: Int) -> XCUIElement {
        return app.collectionViews.children(matching:.cell).element(boundBy: item)
        
    }
    
    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var detailedPhotoImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var nextSolBarButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var previousSolBarButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    
    // MARK: - Actions (interactions)
    
    @discardableResult func tapOnCollectionViewCell(at item: Int, file: String = #file, line: UInt = #line) -> SolPage {
        
        let cell = cellFor(item)
        
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        
        return self

    }

    @discardableResult func tapOnNextSolBarButton(file: String = #file, line: UInt = #line) -> SolPage {

        testCase.expect(exists: nextSolBarButton, file: file, line: line)
        nextSolBarButton.tap()

        return self

    }
    
    @discardableResult func tapOnPreviousSolBarButton(file: String = #file, line: UInt = #line) -> SolPage {
        
        testCase.expect(exists: previousSolBarButton, file: file, line: line)
        previousSolBarButton.tap()
        
        return self
        
    }
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> SolPage {
        
        testCase.expect(exists: saveButton, file: file, line: line)
        saveButton.tap()
        
        return self
        
    }
    
    
    // MARK: - Verifications
    
    @discardableResult func verifyCameraLabel(file: String = #file, line: UInt = #line) -> SolPage {
        
        testCase.expect(exists: cameraLabel, file: file, line: line)
        testCase.expect(cameraLabel.label, equals: "Front Hazard Avoidance Camera")
        
        return self
        
    }
    

    @discardableResult func verifySolHasPictures(file: String = #file, line: UInt = #line) -> SolPage {

        let predicate = NSPredicate(format: "count > 0")
        
        testCase.expectation(for: predicate, evaluatedWith: app.collectionViews.cells)
        testCase.waitForExpectations(timeout: 4, handler: nil)
        
        return self

    }
    
    @discardableResult func verifyDetailedPhotoImageView(file: String = #file, line: UInt = #line) -> SolPage {
        
        testCase.expect(exists: detailedPhotoImageView, file: file, line: line)
        
        return self
        
    }

    struct Camera: Codable, Equatable {
        let id: Int
        let name: String
        let roverId: Int
        let fullName: String
    }

}
