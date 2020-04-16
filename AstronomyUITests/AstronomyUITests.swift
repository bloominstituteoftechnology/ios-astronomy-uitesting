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
    
    
    
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
