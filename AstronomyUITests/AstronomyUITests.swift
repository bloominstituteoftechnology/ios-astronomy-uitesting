//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by macbook on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        
        let app = XCUIApplication()
        app.launch()
        app.launchArguments = ["UITesting"]
        //          This string  ^^  is the launch argument that the application will look for to know that it use local data instead of making network calls

        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingAPhoto() {
        
    }
    
    func testViewingAnotherSol() {
        
      
    }
}
