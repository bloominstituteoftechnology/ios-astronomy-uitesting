//
//  PhotosCollectionPage.swift
//  AstronomyUITests
//
//  Created by Moses Robinson on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoCollectionPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var solLabel: XCUIElement {
        return app.navigationBars.staticTexts
    }
    
    private func imageCellFor(_ index: Int) -> XCUIElement {
        return app.images["PhotosCollectionViewController.ImageCell"]
    }
    
    
    // Interactions
    
    
    
    // Verifications
    
    
}
