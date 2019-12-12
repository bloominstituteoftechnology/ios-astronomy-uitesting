//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jon Bash on 2019-12-12.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    // MARK: - Setup
    
    let app: XCUIApplication = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        
        app.launch()
    }

    // MARK: - Tests
    
    // MARK: - Helper Methods
}
