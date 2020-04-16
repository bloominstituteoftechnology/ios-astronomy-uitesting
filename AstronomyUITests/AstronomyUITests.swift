//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Lambda_School_Loaner_268 on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    //MARK: - PROPERTIES
    
    let app = XCUIApplication()
    
    private var SaveButton: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.SaveButton"]
    }
       
    private var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.SolDetailLabel"]
    }
    private var detailImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    private var solDescription: XCUIElement?
    
    //MARK: - METHODS
    
    override func setUp() {
        app.launchArguments = ["UITesting"]
       
        app.launch()
    
      
        
    }
    
    func testSavePhoto() {
        
        let app = XCUIApplication()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PhotoCollectionViewController.ImageView").element.tap()
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].isHittable)
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
    }
    
    
    
    func testNextSol() {
        XCUIApplication().navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        XCTAssert(solDescription != detailLabel)
        
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
