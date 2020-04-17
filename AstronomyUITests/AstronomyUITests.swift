//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Joshua Rutkowski on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest



class AstronomyUITests: XCTestCase {
    private let app = XCUIApplication()
    
    private func cell(forIndex index: Int) -> XCUIElement {
         return app.collectionViews.children(matching: .cell).matching(identifier: "PhotosCollectionViewController.ImageCell").element(boundBy: index).children(matching: .other).element
     }
    
    override func setUp() {
         // Put setup code here. This method is called before the invocation of each test method in the class.

         // In UI tests it is usually best to stop immediately when a failure occurs.
         continueAfterFailure = false

         app.launchArguments = ["UITesting"]
         app.launch()
         // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
     }

    func testClickSolBack() {
         app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
         XCTAssert(app.navigationBars["Sol 14"].exists)
     }

     func testClickSolForward() {
         app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
         XCTAssert(app.navigationBars["Sol 16"].exists)
     }

     func testSelectingCell() {
          let app = XCUIApplication()

          let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element

          XCTAssertTrue(cell.exists)
          cell.tap()
          XCTAssert(app.navigationBars["Title"].exists)
      }

      func testSavingPhoto() {
          
          let app = XCUIApplication()

          let cell = app.collectionViews.children(matching: .cell).element(boundBy: 3).children(matching: .other).element

          XCTAssertTrue(cell.exists)
          cell.tap()
          XCTAssert(app.navigationBars["Title"].exists)
          let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
          XCTAssertTrue(saveButton.exists)
          saveButton.tap()

          app.alerts["Photo Saved!"].buttons["Okay"].tap()
      }

}
