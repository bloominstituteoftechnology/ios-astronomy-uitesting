//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jessie Ann Griffin on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testSavingPhoto() {
        
    }
    
    func testViewingSolDetails() {
        
    }
    
    func testChoosingAnewSol() {
        
    }
    
    func testScrolling() {
        
    }
}

extension AstronomyUITests {
    
}
