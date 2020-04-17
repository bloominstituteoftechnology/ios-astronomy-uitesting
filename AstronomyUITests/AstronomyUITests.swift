//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Sal B Amer on 4/16/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    
    
    enum Identifier: String {
        case collectioviewCell = "CollectionViewCell.ImageView"
        case detailViewImage = "PhotoDetailViewController.ImageView"
        case saveToDeviceButton = "PhotoDetailViewController.SaveButton"
    }
    
    
    var app: XCUIApplication {
          return XCUIApplication()
      }
    
    func imageView(withId id: Identifier) -> XCUIElement {
        return app.images[id.rawValue]
    }
    func button(withId id: Identifier) -> XCUIElement {
        return app.buttons[id.rawValue]
    }
    
    var saveButton: XCUIElement {
        return button(withId: .saveToDeviceButton)
    }
    
    var detailViewImage: XCUIElement {
        return imageView(withId: .detailViewImage)
    }

    
    override func setUp() {
        app.launchArguments = ["UITesting"]
            app.launch()
    }

//    override func setUpWithError() throws {
//        // Put setup code here. This method is called before the invocation of each test method in the class.
//
//        // In UI tests it is usually best to stop immediately when a failure occurs.
//        continueAfterFailure = false
//
//        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
//    }
//
//    override func tearDownWithError() throws {
//        // Put teardown code here. This method is called after the invocation of each test method in the class.
//    }

//    func testExample() throws {
//        // UI tests must launch the application that they test.
//        let app = XCUIApplication()
//        app.launch()
//
//        // Use recording to get started writing UI tests.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
    
    func testDetailViewImageExists() {
        app.collectionViews.children(matching: .cell).element(boundBy: 6).images["CollectionViewCell.ImageView"].tap()
        XCTAssert(detailViewImage.exists)
    }
    
    func testSavingPhoto() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 6).images["CollectionViewCell.ImageView"].tap()
        XCTAssert(saveButton.isHittable)
        saveButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")

        //        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
//        let statusLabel = app.alerts.matching(identifier: "Photo Saved!")
//        let statusLabelText = statusLabel.allEleme
//                XCTAssertEqual(statusLabelText, "Photo Saved!")
//                XCTAssert(statusLabelText == "Photo Saved!")
        
        
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
