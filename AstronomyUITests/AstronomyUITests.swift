//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lydia Zhang on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
        
    }

    var sol1 : XCUIElement {
        let app = XCUIApplication()
        return app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"]
    }
    var sol2 : XCUIElement {
        let app = XCUIApplication()
        return app.navigationBars["Sol 2"].buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    func testSol() {
        let app = XCUIApplication()
        sol1.tap()
        XCTAssert(app.navigationBars["Sol 2"].exists)
        sol2.tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
    }
    

    private var saveImageButton: XCUIElement {
        let app = XCUIApplication()
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    func testTapDetailVC() {
        let app = XCUIApplication()
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        cell.tap()
        
        let camera = app.staticTexts["PhotoDetailViewController.CameraLabel"]
        XCTAssertNotNil(camera)
        
        let detail = app.staticTexts["PhotoDetailViewController.DetailLabel"]
        XCTAssertNotNil(detail)
        
        let imageExpectation = expectation(description: "Photo Fetched")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            if app.images["PhotoDetailViewController.ImageView"].exists {
                imageExpectation.fulfill()
            } else {
                print("Error fetching image in detailVC")
            }
        }
        wait(for: [imageExpectation], timeout: 10)
        XCTAssertTrue(app.images["PhotoDetailViewController.ImageView"].exists)
    }
    
    func testSave() {
        let app = XCUIApplication()
        testTapDetailVC()
        let save = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(save.isHittable)
        save.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
    func testCellImage() {
        let app = XCUIApplication()
        XCTAssertNotNil(app.images["PhotosCollectionViewController.ImageCell.ImageView"])
    }
}
