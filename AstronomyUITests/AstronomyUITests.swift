//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jason Modisett on 12/6/18.
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
    
    

}
