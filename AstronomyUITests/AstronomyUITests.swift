//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Luqmaan Khan on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    //TEST IDEAS:
    //test sol nav title label on initial load
    //test sol label changes to corresponding sol when the button is tapped
    //test ui alert when saving photo
    
    func solNavBarTitle(solNumber: Int) -> XCUIElement {
        let titleLabel = app.navigationBars["Sol \(solNumber)"]
        XCTAssertTrue(titleLabel.exists)
        return titleLabel
    }
    
    //test sol nav title label on initial load
    func testSolLabelInitialLoad() {
        XCTAssertTrue(solNavBarTitle(solNumber: 15).exists)
    }
    
    //test sol label changes to corresponding sol when the button is tapped (increment)
    func testSolLabelIncrementFromInitialLoad() {
       solNavBarTitle(solNumber: 15).buttons[">"].tap()
        XCTAssertTrue(solNavBarTitle(solNumber: 16).exists)
    }
    
    //test sol label changes to corresponding sol when the button is tapped (decrement)
    func testSolLabelDecrementFromInitialLoad() {
        solNavBarTitle(solNumber: 15).buttons["<"].tap()
        XCTAssertTrue(solNavBarTitle(solNumber: 14).exists)
    }
    
    func testUIAlertWhenSavingphoto() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
        app.buttons["Save to Photo Library"].tap()
    }
}
