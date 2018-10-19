//
//  PhotoDetailPage.swift
//  AstronomyUITests
//
//  Created by Ilgar Ilyasov on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

struct PhotoDetailPage: TestPage {
    
    var testCase: XCTestCase
    
    // MARK: - UI Elements
    
    var image: XCUIElement {
        return app.otherElements.containing(.navigationBar, identifier:"PhotoDetailViewController.ImageView").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
//        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.DetailLabel"]
    }

    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var alert: XCUIElement {
        return app.alerts["Photo Saved!"]
    }
    
    var okayButton: XCUIElement {
        return app.alerts.buttons["Okay"]
    }
    
    // MARK: - Actions
    
    @discardableResult func saveButtonTapped(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        saveButton.tap()
        return self
    }
    
    @discardableResult func tapOkayButton(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        okayButton.tap()
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func verifyDetailsExist(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        testCase.expect(exists: detailLabel)
        return self
    }
    
    @discardableResult func verifyAlertShown(file: String = #file, line: UInt = #line) -> PhotoDetailPage {
        testCase.expect(exists: alert)
        return self
    }
}
