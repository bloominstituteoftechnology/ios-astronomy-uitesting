//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Moin Uddin on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    //Test Navigating to Detail View after pressing on Cell
    func testTapsOnPhoto() {
        PhotoCollectionPage(testCase: self)
        .tapOnPhoto(0)
        .verifyPhoto()
    }
    
    func testSwitchingtoNextSol(){
        PhotoCollectionPage(testCase: self)
        .tapNextSol()
        .verifySolNumber(2)
    }
    
    func testSwitchingtoPreviousSol(){
        PhotoCollectionPage(testCase: self)
        .tapPreviousSol()
        .verifySolNumber(0)
    }
    
    func testSavingPhoto() {
        PhotoCollectionPage(testCase: self)
        .tapOnPhoto(6)
        .tapSaveButton()
        .verifyPhotoSaved()
    }

}
