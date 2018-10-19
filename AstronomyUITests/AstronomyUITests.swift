//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Daniela Parra on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        let app = XCUIApplication()
        continueAfterFailure = false
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() {
        SolCollectionPage(sol: 15, testCase: self)
        .tapOnCell(0)
        .tapSavePhoto()
        .verifyPhotoSaved(file: #file, line: #line)
    }
    
    func testViewingSols() {
        SolCollectionPage(sol: 15, testCase: self)
        .tapPreviousButton()
        .verifyTitle(for: 14, file: #file, line: #line)
        .tapNextButton()
        .tapNextButton()
        .verifyTitle(for: 16, file: #file, line: #line)
    }

    func testDetailPage() {
        SolCollectionPage(sol: 15, testCase: self)
        .tapOnCell(0)
            .verifyDetailLabelDisplays(rover: 5, date: "8/20/12,", time: "8:00 PM", sol: 15, file: #file, line: #line)
    }
    
    func testFirst8CellImages() {
        SolCollectionPage(sol: 15, testCase: self)
        .verifyImageExistsInCell(0, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(1, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(2, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(3, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(4, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(5, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(6, for: 15, file: #file, line: #line)
        .verifyImageExistsInCell(7, for: 15, file: #file, line: #line)
    }
}
