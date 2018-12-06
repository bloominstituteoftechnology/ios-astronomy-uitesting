//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Nikita Thomas on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    

}
