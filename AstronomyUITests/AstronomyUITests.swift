//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kobe McKee on 6/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    var app = XCUIApplication()

    
    override func setUp() {
        app.launchArguments = ["UITesting"]
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

//    override func tearDown() {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

    func testSavingPhoto() {
        print(app)
        
        
        
        
        
    }

}
