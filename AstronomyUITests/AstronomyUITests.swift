//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Ivan Caldwell on 2/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
        // Part 1. Step (2)
        // In the setUp() method of the AstronomyUITests class that comes with your UI test target,
        // create a constant for the application ( let app = XCUIApplication )
        let app = XCUIApplication()
        
        // Part 2. Step (3)
        // Set the app 's launchArguments to ["UITesting"] . This string is the launch argument that
        // the application will look for to know that it use local data instead of making network
        // calls.
        app.launchArguments = ["UITesting"]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
