//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Yvette Zhukovsky on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
         app.launch()
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    
  

    func testPhotoCollection() {
        
        PhotoCollectionTestPage(testCase: self)
        .tapNextSol()
        .swipingUP()
        .swipingDown()
        .tapNextSol()
        .tapPreviousSol()
        .tapOnCell(at: 1)
    
    }

    
    func testDetailPhoto() {
        PhotoCollectionTestPage(testCase: self)
            .tapNextSol()
            .tapOnCell(at: 1)
            .tapSavePhoto()
            .alertButton()
            .goBack()
    }
    
    
}
