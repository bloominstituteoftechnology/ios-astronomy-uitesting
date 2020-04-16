//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Wyatt Harrell on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        let application = XCUIApplication()
        application.launchArguments.append("UITesting")
        return application
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() throws {
        app.launch()

        app.collectionViews.children(matching: .cell).element(boundBy: 0).images["CollectionViewCell.Image"].tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
    
    func testChangingSol() throws {
        app.launch()
        
        let sol15NavigationBar = app.navigationBars["Sol 15"]
        sol15NavigationBar.staticTexts["Sol 15"].tap()
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let sol14NavigationBar = app.navigationBars["Sol 14"]
        sol14NavigationBar.staticTexts["Sol 14"].tap()
        sol14NavigationBar.buttons["PhotosCollectionViewController.NextSolButton"].tap()

        let sol15NavigationBar2 = app.navigationBars["Sol 15"]
        sol15NavigationBar2.staticTexts["Sol 15"].tap()
        sol15NavigationBar2.buttons["PhotosCollectionViewController.NextSolButton"].tap()

        let sol16NavigationBar = app.navigationBars["Sol 16"]
        sol16NavigationBar.staticTexts["Sol 16"].tap()
        sol16NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
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
