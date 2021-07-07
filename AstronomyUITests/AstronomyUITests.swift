//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Nathanael Youngren on 3/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

enum Direction {
    case right
    case left
}

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {

        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments = ["UITesting"] // Use local data instead of network calls
        app.launch()
        addUIInterruptionMonitor(withDescription: "System Dialog") {
            (alert) -> Bool in
            
            if alert.buttons["Allow"].exists {
                alert.buttons["Allow"].tap()
                self.saveButton.tap()
            }
            return true
        }
    }
    
    func testInitialState() {
        XCTAssertTrue(leftButton.exists)
        XCTAssertTrue(rightButton.exists)
    }
    
    func testTapOnImageAndGoBack() {
        
        for i in 0..<app.collectionViews.cells.count {
            let cell = app.collectionViews.cells.element(boundBy: i)
            cell.tap()
            app.navigationBars.buttons.element(boundBy: 0).tap()
        }
    }
    
    func testSavingAnImage() {
        app.collectionViews.cells.element(boundBy: 1).tap()
        saveButton.tap()
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
    
    func testTapRightButtonViewSol() {
        tapSolButton(going: .right)
    }
    
    func testTapLeftButtonViewSol() {
        tapSolButton(going: .left)
    }
    
    func tapSolButton(going direction: Direction) {
        switch direction {
        case .right:
            for _ in 0..<2 {
                rightButton.tap()
            }
        case .left:
            for _ in 0..<2 {
                rightButton.tap()
            }
            for _ in 0..<2 {
                leftButton.tap()
            }
        }
    }
    
    var leftButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var rightButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var saveButton: XCUIElement {
        return app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
    }
    
}
