//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ilgar Ilyasov on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"] // The App will look for to know that it use local data instead of making network calls
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        let app = XCUIApplication()
        let element = app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element
        element.tap()
        
        let element3 = app.otherElements.containing(.navigationBar, identifier:"Title").children(matching: .other).element.children(matching: .other).element
        let element2 = element3.children(matching: .other).element
        element2.tap()
        element2.tap()
        element2.tap()
        
        let photodetailviewcontrollerSavebuttonButton = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        photodetailviewcontrollerSavebuttonButton.tap()
        
        let okayButton = app.alerts["Photo Saved!"].buttons["Okay"]
        okayButton.tap()
        
        let titleNavigationBar = app.navigationBars["Title"]
        titleNavigationBar.buttons["Sol 1"].tap()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        element.tap()
        element2.tap()
        element2.tap()
        photodetailviewcontrollerSavebuttonButton.tap()
        okayButton.tap()
        
        let sol2Button = titleNavigationBar.buttons["Sol 2"]
        sol2Button.tap()
        app.otherElements.containing(.navigationBar, identifier:"Sol 2").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element.swipeUp()
        element3.children(matching: .other).element(boundBy: 1).tap()
        element2.tap()
        element2.tap()
        element2.tap()
        app.otherElements.containing(.alert, identifier:"Photo Saved!").children(matching: .other).element(boundBy: 0).tap()
        okayButton.tap()
        sol2Button.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
