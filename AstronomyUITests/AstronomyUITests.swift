//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jorge Alvarez on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
// Thursday 2-20-20 Afternoon Project

import XCTest

/*

 Part 2 - Writing the tests

 Create a test for every interaction you can think of. To get you started:

     -Test saving a photo. WARNING: You must manually run your app in the simulator and accept the permissions for Photo Library access in the alert controller that appears when you tap the save photo button in the detail view controller of a photo. If you do not do this, you will be unable to write a successful test for saving a photo.
     -Test viewing another sol (Note that since you're using local data, there will only be 3 sols (sols 14-16)

 You should be able to write at least 4 tests. If you're stumped on tests to write, it can be helpful to think about how a normal user would interact with the app.
 */

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launch()
    }
    
    func testCellExists() {
        let app = XCUIApplication()
        let predicate = NSPredicate(format: "exists == false")
        expectation(for: predicate, evaluatedWith: app.collectionViews["CollectionViewCell"], handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
    }

    func testSavingPhoto() {
        
        let app = XCUIApplication()
        
        let predicate = NSPredicate(format: "exists == false")
        expectation(for: predicate, evaluatedWith: app.collectionViews["CollectionViewCell"], handler: nil)
        waitForExpectations(timeout: 3, handler: nil)
        
        app.collectionViews["CollectionViewCell"].tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
}
