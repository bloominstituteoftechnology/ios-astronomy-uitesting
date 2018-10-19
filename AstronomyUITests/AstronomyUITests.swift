//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Madison Waters on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testSavePhoto() {
        
        DetailPage(testCase: self)
        .savePhotoButtonTap()
        
    }
    
    func testSolButtonTaps() {
        
        CollectionPage(testCase: self)
        .previousSolButtonTap()
        .nextSolButtonTap()
        
    }
    
    func testSolLabel() {
        
        CollectionPage(testCase: self)
        .verifySolLabels()
        
    }
    
    func testCell() {
        
        CollectionPage(testCase: self)
        .collectionViewCell(at: 1)
        
        }
    
    func testExample() {
        
        
        let app = XCUIApplication()
        let sol14NavigationBar = app.navigationBars["Sol 14"]
        sol14NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        sol14NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 16"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionViewsQuery = app.collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotoCollectionViewController.ImageView").element.tap()
        
        let sol15Button = app.navigationBars["Title"].buttons["Sol 15"]
        sol15Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).otherElements.containing(.image, identifier:"PhotoCollectionViewController.ImageView").element.tap()
        sol15Button.tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).otherElements.containing(.image, identifier:"PhotoCollectionViewController.ImageView").element.tap()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
