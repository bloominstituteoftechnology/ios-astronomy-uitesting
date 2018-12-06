//
//  PhotosCollectionViewControllerPage.swift
//  AstronomyUITests
//
//  Created by Jason Modisett on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotosCollectionViewControllerPage: TestPage {
    
    // MARK:- Accessibility identifiers enum
    
    enum Identifiers: String {
        case prevSolButton = "PhotosCollectionViewController.PreviousSolButton"
        case nextSolButton = "PhotosCollectionViewController.NextSolButton"
        case solDayLabel = "PhotosCollectionViewController.SolDayLabel"
        
        
        func id() -> String { return self.rawValue }
    }
    
    var testCase: XCTestCase
    
    // MARK:- UI elements
    
    var previousSolButton: XCUIElement { return app.buttons[Identifiers.prevSolButton.id()] }
    var nextSolButton: XCUIElement { return app.buttons[Identifiers.nextSolButton.id()] }
    var solDayLabel: XCUIElement { return app.staticTexts[Identifiers.solDayLabel.id()] }
    
    
}
