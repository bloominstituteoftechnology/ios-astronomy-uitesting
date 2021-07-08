//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Farhan on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        
        
//        let app = XCUIApplication()
//        let collectionView = app.otherElements.containing(.navigationBar, identifier:"Sol 1").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .collectionView).element
////        collectionView.swipeUp()
//        app.swipeUp()
//        app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
//        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.collectionViews.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.tap()
//        app.buttons["PhotoDetailViewController.SaveButton"].tap()
//        app.alerts["“Astronomy” Would Like to Access Your Photos"].buttons["OK"].tap()
        
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testNavigationBetweenSols(){
        
        _ = PhotoPage(testCase: self)
        .tapOnNextSol()
        .tapOnNextSol()
        .tapOnPreviousSol()
        
        .verifyImagesDisplayedInCells()
    }
    
    func testNavigationToDetailView() {
        
        _ = PhotoPage(testCase: self)
        .tapOnVisibleCell()
        
        _ = DetailPage(testCase: self)
        .tapOnSavePhotoButton()
        
    }
    
    func testPhotoSaving(){
        _ = PhotoPage(testCase: self)
        .tapOnVisibleCell()
        
        _ = DetailPage(testCase: self)
        .tapOnSavePhotoButton()
        .verifyPhotoAlertAppears()
        .tapOnOKToSaveButton()
        
    }

}
