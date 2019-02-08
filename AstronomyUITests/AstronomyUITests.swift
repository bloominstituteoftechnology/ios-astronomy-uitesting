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

    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    var navigationBarTtle: XCUIElement {
        return app.navigationBars.allElementsBoundByIndex[1]
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

    var title: String {
        return app.navigationBars.element(boundBy: 0).identifier
    }
    
    
    
    func testNavigationBarButtonNext() {
        nextItem.tap()
        
    }
    
    func testNavigationBarButtonPrev() {
        
        prevItem.tap()
        
    }

    func testPhotosCollectionViewControllerUIButtonsAndCellImageTap() {
        
        let cell: XCUIElement = app.cells["cell0"]
        nextItem.tap()
        prevItem.tap()
       // let titleChanged = XCUIElement.didChange(navigationBarTtle)
        cell.tap()
        saveButton.tap()
        }

}
