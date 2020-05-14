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

    private func button(id: Identifier) -> XCUIElement {
        return app.buttons[id.rawValue]
    }

    // MARK: - Tests

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
