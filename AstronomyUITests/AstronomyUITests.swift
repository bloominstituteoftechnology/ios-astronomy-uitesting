//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lydia Zhang on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    private let app = XCUIApplication()
    private var cell: XCUIElement {
        app.collectionViews.element(boundBy: 0)
    }
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
        
    }

    
    func testNextSol() {
        app.navigationBars["Sol 10"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 11"].exists)
    }
    func testPreSol() {
        app.navigationBars["Sol 11"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertTrue(app.navigationBars["Sol 10"].exists)
    }
    

    func testTapDetailVC() {
        XCTAssertTrue(cell.exists)
        
        cell.tap()
        let imageExpectation = expectation(description: "Photo Fetched")
        XCTAssertTrue(app.buttons["PhotoDetailViewController.SaveButton"].exists)
        XCTAssertTrue(app.buttons["PhotoDetailViewController.CameraLabel"].exists)
        XCTAssertTrue(app.buttons["PhotoDetailViewController.PhotoDetailLabel"].exists)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            if self.app.images["PhotoDetailViewController.ImageView"].exists {
                imageExpectation.fulfill()
            } else {
                print("Error fetching image in detailVC")
            }
        }
        wait(for: [imageExpectation], timeout: 5)
        XCTAssertTrue(app.images["PhotoDetailViewController.ImageView"].exists)
    }
    
    func testSave() {
        testTapDetailVC()
        let save = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(save.isHittable)
        save.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
}
