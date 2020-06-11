//
//  PhotoDetailViewPage.swift
//  AstronomyUITests
//
//  Created by Enzo Jimenez-Soto on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
import Photos

struct PhotoDetailViewPage: TestPage {
    
    let testCase: XCTestCase
    
    // Elements
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.DetailLabel"]
    }
    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    var savePhotoAlert: XCUIElement {
        return app.alerts["Photo Saved!"]
    }
    var savePhotoAlertOkayButton: XCUIElement {
        return savePhotoAlert.buttons["Okay"]
    }
    
    // Interactions
    
    
    @discardableResult func tapOnSaveButton(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        testCase.expect(exists: saveButton, file: file, line: line)
        saveButton.tap()
        return self
    }
    @discardableResult func tapOnPhotoAlertOkayButton(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        testCase.expect(exists: savePhotoAlert, file: file, line: line)
        testCase.expect(exists: savePhotoAlertOkayButton, file: file, line: line)
        savePhotoAlertOkayButton.tap()
        testCase.expect(doesNotExist: savePhotoAlert, file: file, line: line)
        testCase.expect(doesNotExist: savePhotoAlertOkayButton, file: file, line: line)
        return self
    }
    
    // Verifications
    
    @discardableResult func verifyImageViewHasImage(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        testCase.expect(exists: imageView, file: file, line: line)
        testCase.expect(notNil: imageView.images)
        return self
    }
    @discardableResult func verifyDetailLableHasAdequateText(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        testCase.expect(exists: detailLabel, file: file, line: line)
        testCase.expect(detailLabel.label, notEquals: "Taken by <Rover> on <date> (Sol <sol>)")
        return self
    }
    @discardableResult func verifyCameraLabelHasAdequateText(file: String = #file, line: UInt = #line) -> PhotoDetailViewPage {
        testCase.expect(exists: cameraLabel, file: file, line: line)
        testCase.expect(cameraLabel.label, notEquals: "Label")
        return self
    }
    
    
}
