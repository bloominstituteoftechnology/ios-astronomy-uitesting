//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Chris Dobek on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    // MARK: - Helper Properties
    private let app = XCUIApplication()

    override func setUp()  {
        app.launch()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]

    }

    

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
