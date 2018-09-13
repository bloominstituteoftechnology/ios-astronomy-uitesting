//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Conner on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        
    }
    
}
