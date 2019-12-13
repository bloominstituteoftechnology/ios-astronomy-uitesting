//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by morse on 12/11/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: - Properties
    
//    private var app: XCUIApplication = {
//        let app = XCUIApplication()
//        app.launchArguments = ["UITesting"]
//        return app
//    }()
    
    private let app = XCUIApplication()
    
    private func cell(forIndex index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).matching(identifier: "PhotosCollectionViewController.ImageCell").element(boundBy: index).children(matching: .other).element
    }
    
    
//    private var turnLabel: XCUIElement {
//        return app.staticTexts["GameViewController.TurnLabel"]
//    }
    
    
    
    // MARK: - Tests

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    
    func testSolBack() {
        app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 14"].exists)
    }
    
    func testSolForward() {
        app.navigationBars["Sol 15"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        XCTAssert(app.navigationBars["Sol 16"].exists)
    }
    
    func testCellOpens() {
        let cell0 = cell(forIndex: 0)
        cell0.tap()
        XCTAssert(app.navigationBars["Title"].exists)
    }
    
    func testSavePhoto() {
        let cell1 = cell(forIndex: 0)
        cell1.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].exists)
    }
//
//    func testSomeThings() {
//        app.launchArguments = ["UITesting"]
//
//        let cell0 = cell(forIndex: 0)
//        cell0.tap()
//
//        let app = XCUIApplication()
//        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element // imageView
//        element.tap()
//        element.tap()
//
//
//        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap() // photoSave button
////        app.alerts["“Astronomy” Would Like to Access Your Photos"].scrollViews.otherElements.buttons["OK"].tap() // OK button
//        app.navigationBars["Title"].buttons["Sol 1"].tap() // "back"
//        app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
//
//        app.navigationBars["Sol 1"].exists
//        app.alerts
//
//
//        app.children(matching: .window).element(boundBy: 0).tap()
//        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
//
//    }
}
