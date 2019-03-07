//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_34 on 3/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    //MARK: - Properties

    override func setUp() {
        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        
    }

    func testSavingPhoto() {
        
        
    }
    
    func 
}
