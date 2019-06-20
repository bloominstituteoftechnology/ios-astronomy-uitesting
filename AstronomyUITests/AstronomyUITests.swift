//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Diante Lewis-Jolley on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app: XCUIApplication {
        return XCUIApplication()
    }

    override func setUp() {

        continueAfterFailure = false

        app.launchArguments = ["UITesting"]
        app.launch()



    }


}
