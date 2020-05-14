//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Mark Poggi on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    // MARK: - Properties

    enum Identifier: String {
        case savePhotoButton = "PhotoDetailViewController.SaveButton"
        case photoCellImageView = "PhotosCollectionViewController.ImageCell.ImageView"
        case detailVCImageView = "PhotoDetailViewController.ImageView"
        case nextSolButton = "PhotosCollectionViewController.NextSolButton"
        case previousSolButton = "PhotosCollectionViewController.PreviousSolButton"
        
    }

    private var app: XCUIApplication {
        return XCUIApplication()
    }

    private func imageView(id: Identifier) -> XCUIElement {
        return app.images[id.rawValue]
    }

    private func button(id: Identifier) -> XCUIElement {
        return app.buttons[id.rawValue]
    }

    private var cellImageView: XCUIElement {
        return imageView(id: .photoCellImageView)
    }

    private var nextSolButton: XCUIElement {
        return button(id: .nextSolButton)
    }

    private var previousSolButton: XCUIElement {
        return button(id: .previousSolButton)
    }

    private var savePhotoButton: XCUIElement {
        return button(id: .savePhotoButton)
    }



    // MARK: - Tests

    func testCellImageViewHasLoaded() {
        XCTAssertNotNil(cellImageView)
    }

    func testNextSolButton() {
        XCTAssert(nextSolButton.isHittable)
        nextSolButton.tap()
    }

    func testpreviousSolButton() {
          XCTAssert(previousSolButton.isHittable)
          nextSolButton.tap()
      }

    func testSavePhotoButton() {
        app.cells.element(boundBy: 0).tap()
        XCTAssert(savePhotoButton.isHittable)
        savePhotoButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
