//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Benjamin Hakes on 1/31/19.
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
        
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launch()
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testTapOnCollectionViewCell1(){
        
        SolPage(testCase: self)
        .tapOnCollectionViewCell(at: 1)
        
    }
    
    func testTapOnNextSolBarButton(){
        
        SolPage(testCase: self)
        .tapOnNextSolBarButton()
        .verifySolHasPictures()

    }
    
    func testCameraLabel(){
        
        SolPage(testCase: self)
            .tapOnCollectionViewCell(at: 0)
            .verifyCameraLabel()
        
    }
    
//    func testTheTitleOfTheApp(){
//
////        SolPage(testCase: self)
//        let app = XCUIApplication()
//
//        print(app.collectionViews[""])
//        let predicate = NSPredicate(format: "%d == \"Sol 1\"")
//
//        let fetchedAstronomyExpectation = expectation(for: predicate, evaluatedWith: app.title, handler: nil)
//
//        fetchedAstronomyExpectation.expectationDescription = "The title of should be set to \"Sol 1\" to start."
//
//        wait(for: [fetchedAstronomyExpectation], timeout: 5)
//
//    }
}
