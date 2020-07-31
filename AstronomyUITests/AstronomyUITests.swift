//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Juan M Mariscal on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest


class AstronomyUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]

        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    func testSavingPhoto() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        let imageviewtosaveElement = app.collectionViews
                                    .children(matching: .cell)
                                    .element(boundBy: 0)
                                    .otherElements.containing(.image, identifier:"imageViewToSave").element
        imageviewtosaveElement.tap()
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        
    }
    
    func testViewingNewSol() {
        
        
        let app = XCUIApplication()
        app.launch()
        
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 3"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
    }
    
    func testScrollingImages() {
       
        let app = XCUIApplication()
        app.launch()
        
        let collectionViewsQuery = app.collectionViews
        let imageviewtosaveElement = collectionViewsQuery.children(matching: .cell)
                                    .element(boundBy: 5)
                                    .otherElements
                                    .containing(.image, identifier:"imageViewToSave").element
        imageviewtosaveElement.swipeUp()
        
        let verticalScrollBar3PagesCollectionView = app/*@START_MENU_TOKEN@*/.collectionViews.containing(.other, identifier:"Vertical scroll bar, 3 pages").element/*[[".collectionViews.containing(.other, identifier:\"Horizontal scroll bar, 1 page\").element",".collectionViews.containing(.other, identifier:\"Vertical scroll bar, 3 pages\").element"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        verticalScrollBar3PagesCollectionView.swipeDown()
        imageviewtosaveElement.swipeUp()
        verticalScrollBar3PagesCollectionView.swipeDown()
        verticalScrollBar3PagesCollectionView.swipeUp()
        collectionViewsQuery.children(matching: .cell)
                            .element(boundBy: 6)
                            .otherElements
                            .containing(.image, identifier:"imageViewToSave")
                            .element.swipeDown()
                
    }
    
    func testBackToSolFromImageDetail() {
        
        let app = XCUIApplication()
        app.launch()
        
        let imageviewtosaveElement = app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"imageViewToSave").element
        imageviewtosaveElement.tap()
        
        let sol1Button = app.navigationBars["Title"].buttons["Sol 1"]
        sol1Button.tap()
        imageviewtosaveElement.tap()
        sol1Button.tap()
        
    }
    
    func testBack() {
      
        let app = XCUIApplication()
        app.launch()
        let imageviewtosaveElement = app.collectionViews.children(matching: .cell).element(boundBy: 2).otherElements.containing(.image, identifier:"imageViewToSave").element
        imageviewtosaveElement.tap()

        let sol1Button = app.navigationBars["Title"].buttons["Sol 1"]
        sol1Button.tap()
        imageviewtosaveElement.tap()
        sol1Button.tap()
        imageviewtosaveElement.tap()
        sol1Button.tap()
        
    }
    
    func testSixthImageSelected() {
        
        let app = XCUIApplication()
        app.launch()

        app.images["PhotoDetailViewController.ImageView"].waitForExistence(timeout: 2)
        let imageviewtosaveElement = app.collectionViews
                                    .children(matching: .cell)
                                    .element(boundBy: 5)
                                    .otherElements.containing(.image, identifier:"imageViewToSave").element
        imageviewtosaveElement.tap()
        
        
    }
    
    func testCorrectDetailImageSelected() {
        
        let app = XCUIApplication()
        app.launch()
        
        app.collectionViews.children(matching: .cell).element(boundBy: 5).otherElements.containing(.image, identifier:"imageViewToSave").element.tap()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.tap()
        
    }

}
