//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Jessie Ann Griffin on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        //continueAfterFailure = false
    }

    func testSavingPhoto() {

        app.collectionViews.children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"imageOnColllectionView").element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let savePhotoAlert = app.alerts["Photo Saved!"]
        
        XCTAssert(savePhotoAlert.exists)
    }
    
    func testViewingImageDetails() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 4).otherElements.containing(.image, identifier:"imageOnColllectionView").element.tap()
        
        let photoDetailShowing = app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        
        XCTAssert(photoDetailShowing)
    }
    
    func testChoosingAnewSol() {
        
        app.navigationBars["Sol 1"]
        app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"].tap()
//        let nextTitle = app.navigationBars["Sol 2"]
        XCTAssert(app.navigationBars["Sol 2"].exists)
        
    }
    
    func testScrollThenTap() {
        
        
        let collectionViewsQuery = XCUIApplication().collectionViews
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).otherElements.containing(.image, identifier:"imageOnColllectionView").element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 7).otherElements.containing(.image, identifier:"imageOnColllectionView").element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 6).otherElements.containing(.image, identifier:"imageOnColllectionView").element.swipeUp()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 13).otherElements.containing(.image, identifier:"imageOnColllectionView").element.tap()
        
        let scrollDistance = collectionViewsQuery.children(matching: .cell).element(boundBy: 15).otherElements.containing(.image, identifier:"imageOnColllectionView").element
        let photo = collectionViewsQuery.children(matching: .cell).element(boundBy: 13).otherElements.containing(.image, identifier:"imageOnColllectionView").element
    }
}

extension AstronomyUITests {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
    
}
