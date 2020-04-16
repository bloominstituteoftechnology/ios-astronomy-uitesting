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

    override func setUp() {
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
        
    }
    
    var sol1 : XCUIElement {
        return app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"]
    }
    var sol2 : XCUIElement {
    return app.navigationBars["Sol 2"].buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    func testSol() {
        sol1.tap()
        XCTAssert(app.navigationBars["Sol 2"].exists)
        sol2.tap()
        XCTAssert(app.navigationBars["Sol 1"].exists)
    }
    

    private var saveImageButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    func testTapDetailVC() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        
        let imageExpectation = expectation(description: "Photo Fetched")
        
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
    
    func testCellImage() {
        XCTAssertNotNil(app.images["PhotosCollectionViewController.ImageCell.ImageView"])
    }
}
