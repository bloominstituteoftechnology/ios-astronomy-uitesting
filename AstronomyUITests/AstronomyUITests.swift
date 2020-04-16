//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Bradley Diroff on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private func buttonFor(_ index: Int) -> XCUIElement {
        return app.buttons["button\(index)"]
    }
    
    
    override func setUp() {
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let cellTester = app.collectionViews.cells.firstMatch
        cellTester.tap()
      
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        print("PUSHING BUTTON \(app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].accessibilityActivate())")
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
        print("PUSHED BUTTON \(app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].accessibilityActivate())")
        
  //      XCTAssertTrue(<#T##expression: Bool##Bool#>)
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
