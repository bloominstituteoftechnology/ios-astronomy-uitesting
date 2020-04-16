//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lydia Zhang on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    private let app = XCUIApplication()
    
    override func setUp() {
        continueAfterFailure = false
        app.launch()
        app.launchArguments = ["UITesting"]
        
    }

    
}
