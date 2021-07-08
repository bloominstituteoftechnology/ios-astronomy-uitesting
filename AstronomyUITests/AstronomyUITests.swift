//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Carolyn Lea on 9/13/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
        
    override func setUp()
    {
        super.setUp()
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample()
    {
        let app = XCUIApplication()
        print ("File: \(#file)")
        print ("Line: \(#line)")
        print(app)
    }
    
    func testNextSolWorks()
    {
        CollectionViewPage(testCase: self)
        .tapOnNextSol()
    }
    
    func testPreviousSolWorks()
    {
        CollectionViewPage(testCase: self)
        .tapOnPreviousSol()
    }
    
    
    func testCollectionViewCell()
    {
        CollectionViewPage(testCase: self)
        .tapOnCollectionViewCell(at: 0)
    }
    
    func testImageExists()
    {
        CollectionViewPage(testCase: self)
        .tapOnCollectionViewCell(at: 0)
        .verifyImageExists()
    }
    
    func testSaveButtonWorks()
    {
        CollectionViewPage(testCase: self)
        .tapOnCollectionViewCell(at: 0)
        .tapOnSaveButton()
        .verifyImageExists()
    }
}
