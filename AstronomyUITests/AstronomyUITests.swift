//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kenneth Jones on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    func testExample() throws {
        
    }

}
