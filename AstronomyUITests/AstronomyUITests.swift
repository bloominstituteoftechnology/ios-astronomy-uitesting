//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Kenny on 2/20/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    enum identifiers: String {
        case photoButton = "PhotoDetailViewController.SaveButton"
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testSavingPhoto() {
        
    }
}
