//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Cody Morley on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
//    //MARK: - Types -
//    enum StringID: String {
//        case solForward = "PhotosCollectionViewController.NextSolButton"
//        case solBack = "PhotosCollectionViewController.PreviousSolButton"
//        case detailImage = "PhotoDetailViewController.ImageView"
//        case saveButton = "PhotoDetailViewController.SaveButton"
//    }
//
//
//    //MARK: - Properties -
//    private var app: XCUIApplication {
//        return XCUIApplication()
//    }
//
//
//    //MARK: - UI Element Assignment Methods -
//    private func button(_ id: StringID) -> XCUIElement {
//        return app.buttons[id.rawValue]
//    }
//
//    private func imageView(_ id: StringID) -> XCUIElement {
//        return app.images[id.rawValue]
//    }
//
//
//    //MARK: - Testing Enviroment: Set Paramenters -
//    override func setUp() {
//        app.launchArguments = ["UITesting"]
//        app.launch()
//    }
//
//
//    //MARK: - Tests -
//    func testChangeSol() throws {
//        let forward = button(.solForward)
//        forward.tap()
//        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
//
//
//        //app.navigationBars["Sol 14"] //use correct one for test but this is the syntax
//    }
//
//    func testCellHasImage() throws {
//
//    }
//
//    func testDetailView() throws {
//
//
//        app.navigationBars.buttons["Back"] // access the back button
//    }
//
//    func testSavePicture() throws {
//
//    }
    
    
    override func setUp() {
      let app = XCUIApplication()
      app.launchArguments = ["UITesting"]
      continueAfterFailure = false
      app.launch()
    }
    
    
    func testViewNextSolImages() {
      let app = XCUIApplication()
      let nextButton = app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"]
      XCTAssert(nextButton.exists)
      nextButton.tap()
      XCTAssertTrue(app.navigationBars["Sol 16"].exists)
      XCTAssertFalse(app.navigationBars["Sol 15"].exists)
    }
    
}
