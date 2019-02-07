//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Sergey Osipyan on 2/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    
    var app: XCUIApplication!
    
    var prevItem: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextItem: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }

    var photoViewImage: XCUIElement {
        
        return app.collectionViews.children(matching: .cell).element(boundBy: 1).children(matching: .other).element
   }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        if app.state == .notRunning {
            app.launch()
            
        } else if app.state != .runningForeground {
            app.activate()
        }
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

   

    func testPhotosCollectionViewControllerUIButtonsAndCells() {
       
        nextItem.tap()
        prevItem.tap()
        photoViewImage.tap()
        
        
//        let app = XCUIApplication()
//        app.navigationBars["Sol 1"].buttons["PhotosCollectionViewController.NextSolButton"].tap()
//        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
  //   let titleNavigationBar = app.navigationBars["Title"]
//        let sol3Button = titleNavigationBar.buttons["Sol 3"]
//        sol3Button.tap()
//
//        let collectionViewsQuery = app.collectionViews
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.tap()
//        sol3Button.tap()
//        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//
//        let photoscollectionviewcontrollerNextsolbuttonButton = app.navigationBars["Sol 10"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
//        photoscollectionviewcontrollerNextsolbuttonButton.tap()
//        photoscollectionviewcontrollerNextsolbuttonButton.tap()
//        photoscollectionviewcontrollerNextsolbuttonButton.tap()
//
//        let sol14NavigationBar = app.navigationBars["Sol 14"]
//        sol14NavigationBar.tap()
//        sol14NavigationBar/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element.tap()
//        titleNavigationBar.buttons["Sol 15"].tap()
//        collectionViewsQuery.children(matching: .cell).element(boundBy: 4).children(matching: .other).element.tap()
//
    
       // element.tap()
//        app.staticTexts["Taken by 5 on 8/6/12, 5:00 PM (Sol 1)"].tap()
//        app.staticTexts["Mast Camera"].tap()
//        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["Photo Saved!"].buttons["Okay"].tap()
//
//        let titleNavigationBar = app.navigationBars["Title"]
//        titleNavigationBar.otherElements["Title"].tap()
//        titleNavigationBar.buttons["Sol 1"].tap()
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
