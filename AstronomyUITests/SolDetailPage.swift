//
//  SolDetailPage.swift
//  AstronomyUITests
//
//  Created by Daniela Parra on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct SolDetailPage: TestPage {
    
    var sol: Int
    var solCollectionPage: SolCollectionPage
    
    // Element
    var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.DetailLabel"]
    }
    
    var backToCollectionButton: XCUIElement {
        return app.navigationBars.buttons["Sol \(sol)"]
    }
    
    // Interactions
    
    // Tap back to collection view.
    @discardableResult func tapBackToCollectionButton() -> SolCollectionPage {
        backToCollectionButton.tap()
        return solCollectionPage
    }
    
    // Tap save photos button
    @discardableResult func tapSavePhoto() -> SolDetailPage {
        savePhotoButton.tap()
        return self
    }
    
    // Verifications
    
    @discardableResult func verifyDetailLabelDisplays(rover: Int, date: String, time: String, sol: Int, file: String, line: UInt) -> SolDetailPage {
        testCase.expect(exists: detailLabel, file: file, line: line)
        let string = "Taken by \(rover) on \(date) \(time) (Sol \(sol))"
        testCase.expect(detailLabel.label, equals: string, file: file, line: line)
        return self
    }
    
    @discardableResult func verifyPhotoSaved(file: String, line: UInt) -> SolDetailPage {
        testCase.expect(exists: app.alerts["Photo Saved!"], file: file, line: line)
        return self
    }
    
    var testCase: XCTestCase
}
