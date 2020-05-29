//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Elizabeth Thomas on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }

    func testSaveFirstPhoto() throws {
        
        app.launch()
        
        app.collectionViews.cells.element(boundBy: 0).tap()
        saveButton()

    }

    func testAnotherSol() throws {
        
        app.launch()
        sleep(2)
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        sleep(2)
    }
    
    func testSwipes() throws {
        app.launch()
        
        swipe()
    }
    
    func testAnotherSolSwipeAndSavePhoto() throws {
        app.launch()
        sleep(2)
        
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        app.buttons["PhotosCollectionViewController.NextSolButton"].tap()
        
        swipe()
        app.collectionViews.cells.element(boundBy: 2).tap()
        
        saveButton()
    }
    
    func saveButton() {
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    func swipe() {
        let element = app.collectionViews.cells.element(boundBy: 0)
        element.swipeUp()
        let secondElement = app.collectionViews.cells.element(boundBy: 2)
        secondElement.swipeUp()
        secondElement.swipeDown()
    }
    
}
