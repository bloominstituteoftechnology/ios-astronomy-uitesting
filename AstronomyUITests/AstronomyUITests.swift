//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Gi Pyo Kim on 11/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        

    }

    func testSavePhoto() {
        let cell0 = cell(forIndex: 0)
        cell0.tap()
        
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        XCTAssertTrue(saveButton.exists)
        saveButton.tap()
        
        let alert = app.alerts["Photo Saved!"]
        XCTAssertTrue(alert.exists)
        alert.scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    func testDetailInfo() {
        cell(forIndex: 5).tap()
        
        let photoDetailLabel = app.staticTexts["PhotoDetailLabel"]
        let cameraLabel = app.staticTexts["CameraLabel"]
        
        XCTAssertEqual(photoDetailLabel.label, "Taken by 5 on 8/19/12, 5:00 PM (Sol 14)")
        XCTAssertEqual(cameraLabel.label, "Mast Camera")
    }
    
    func testGoBackFromDetailView() {
        let cell1 = cell(forIndex: 1)
        cell1.tap()
        XCTAssertTrue(detailTitleNavigationBar.exists)
        
        detailTitleNavigationBar.buttons["Sol 14"].tap()
        XCTAssertTrue(solTitleBar(forSol: 14).exists)
    }
    
    func testCycleSols() {
        
        solTitleBar(forSol: 14)/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(solTitleBar(forSol: 15).exists)
        
        solTitleBar(forSol: 15)/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(solTitleBar(forSol: 16).exists)
        
        solTitleBar(forSol: 16)/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(solTitleBar(forSol: 15).exists)
        
        solTitleBar(forSol: 15)/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssertTrue(solTitleBar(forSol: 14).exists)
    }

    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var collectionViewsQuery: XCUIElementQuery {
        return app.collectionViews
    }
    
    private var detailTitleNavigationBar: XCUIElement {
        return app.navigationBars["Title"]
    }
    
    private func solTitleBar(forSol index: Int) -> XCUIElement {
        return app.navigationBars["Sol \(index)"]
    }
    
    private func cell(forIndex index: Int) -> XCUIElement {
        return collectionViewsQuery.children(matching: .cell).element(boundBy: index).otherElements.containing(.image, identifier:"CollectionViewCell").element
    }
}
