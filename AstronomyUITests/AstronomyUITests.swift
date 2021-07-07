//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Vici Shaweddy on 11/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()



        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingAPhoto() {
        // Use recording to get started writing UI tests.
        app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
        
        let button = app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        
        let alert = app.alerts["Photo Saved!"]
        XCTAssert(alert.exists)
    }
    
    func testNextSol() {
        app.navigationBarTitle(for: 14).buttons[">"].tap()
        XCTAssert(app.navigationBarTitle(for: 15).exists)
    }
    
    func testPreviousSol() {
        app.navigationBarTitle(for: 14).buttons[">"].tap()
        app.navigationBarTitle(for: 15).buttons[">"].tap()
        app.navigationBarTitle(for: 16).buttons["<"].tap()
        app.navigationBarTitle(for: 15).buttons["<"].tap()

        XCTAssert(app.navigationBarTitle(for: 14).exists)
    }
    
    func testBackButton() {
        app.collectionViews.children(matching: .cell).element(boundBy: 1).otherElements.containing(.image, identifier:"imageCell").element.tap()
        let backButton = app.navigationBars["Title"].buttons["Sol 14"]
        backButton.tap()
        
        XCTAssert(app.navigationBarTitle(for: 14).exists)
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIApplication {

    func navigationBarTitle(for sol: Int) -> XCUIElement {
        return XCUIApplication().navigationBars["Sol \(sol)"]
    }
}
