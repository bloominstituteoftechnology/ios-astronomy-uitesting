//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jonalynn Masters on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false
        app.launch()
    }
    
    
    
}
