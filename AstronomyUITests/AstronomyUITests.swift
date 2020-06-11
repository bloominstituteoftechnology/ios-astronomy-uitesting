//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Cody Morley on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    //MARK: - Types -
    enum AccessibilityID: String {
        
    }
    
    
    //MARK: - Properties -
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    
    //MARK: - Testing Enviroment: Set Paramenters -
    override func setUp() {
        app.launchArguments = ["UITesting"]
        app.launch()
        super.setUp()
    }
    
    
    //MARK: - Tests -
    func testChangeSol() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testCellHasImage() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testDetailView() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    func testSavePicture() throws {
        let app = XCUIApplication()
        app.launch()
    }
    
    
}
