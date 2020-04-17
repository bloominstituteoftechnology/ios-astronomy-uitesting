//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Mark Gerrior on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    // MARK: - Helper Prorperties
    
    private var app: XCUIApplication!
    
    private var takenLabel: XCUIElement {
        return app.staticTexts["DetailView.TakenLabel"]
    }
    
    private var cameraLabel: XCUIElement {
        return app.staticTexts["DetailView.CameraLabel"]
    }

    // MARK: - Test Setup

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app = XCUIApplication()
        app.launchArguments.append("UITesting")

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // MARK: - Tests

    func testNavigationBar() throws {

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        // TODO: How do I look at navigationBars in variable navigator?
        let sol14NavigationBar = app.navigationBars["Sol 14"]
        let sol15NavigationBar = app.navigationBars["Sol 15"]
        let sol16NavigationBar = app.navigationBars["Sol 16"]

        // Verify starting at Sol 15
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")

        // Go to prior Sol 14
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(sol14NavigationBar.staticTexts["Sol 14"].label, "Sol 14")

        // Verify at the previous end
        sol14NavigationBar.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertEqual(sol14NavigationBar.staticTexts["Sol 14"].label, "Sol 14")

        // Go to next Sol 15
        sol14NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")

        // Go to next Sol 16
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(sol16NavigationBar.staticTexts["Sol 16"].label, "Sol 16")

        // Go to next Sol. At the end so we're stuck
        sol16NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(sol16NavigationBar.staticTexts["Sol 16"].label, "Sol 16")
        
        // Back to Sol 15
        sol16NavigationBar.buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")
    }

    func testSavePic() throws {
        
        let sol15NavigationBar = app.navigationBars["Sol 15"]

        // Verify starting at Sol 15
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")

        // Select first image
        app.collectionViews.cells["0"].tap()

        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        XCTAssertEqual(cameraLabel.label, "Front Hazard Avoidance Camera")

        // TODO: ? Why does this have both Buttons and StaticTexts?
        // Touch the Save to Photo Library button
        app.buttons["Save to Photo Library"].tap()
//        app/*@START_MENU_TOKEN@*/.buttons["Save to Photo Library"].staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[2]]@END_MENU_TOKEN@*/.tap()

        // Touch the Okay button
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
        // Go back to gallary view
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")
    }
    
    func testScrollToLastCell() throws {
        
        let sol14NavigationBar = app.navigationBars["Sol 14"]
        let sol15NavigationBar = app.navigationBars["Sol 15"]

        // Verify starting at Sol 15
        XCTAssertEqual(sol15NavigationBar.staticTexts["Sol 15"].label, "Sol 15")

        // Go to prior Sol 14
        sol15NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertEqual(sol14NavigationBar.staticTexts["Sol 14"].label, "Sol 14")

        // TODO: ? Do this quickly?
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()

        // Select last image
        app.collectionViews.cells["69"].tap()
        
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/19/12, 5:00 PM (Sol 14)")
        XCTAssertEqual(cameraLabel.label, "Navigation Camera")

    }
    
    func testOpenCloseOnASeriesOfCells() throws {
        // 4, 5, 2, 6

        let collectionViewsQuery = app.collectionViews
        let sol15Button = app.navigationBars["Title"].buttons["Sol 15"]
        
        // TODO: ? This...
//        collectionViewsQuery.cells["3"].children(matching: .other).element.tap()
        // vs this...
        collectionViewsQuery.cells["3"].tap()
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        sol15Button.tap() // back
        
        collectionViewsQuery.cells["4"].tap()
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        sol15Button.tap() // back

        collectionViewsQuery.cells["2"].tap()
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        sol15Button.tap() // back

        collectionViewsQuery.cells["5"].tap()
        XCTAssertEqual(takenLabel.label, "Taken by 5 on 8/20/12, 5:00 PM (Sol 15)")
        sol15Button.tap() // back
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                app.launch()
            }
        }
    }
}
