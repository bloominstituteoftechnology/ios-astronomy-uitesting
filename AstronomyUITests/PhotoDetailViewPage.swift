//
//  PhotoDetailViewPage.swift
//  AstronomyUITests
//
//  Created by Jason Modisett on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoDetailViewPage: TestPage {
    
    // MARK:- Accessibility identifiers enum
    
    enum Identifiers {
        static let navBar = "PhotoDetailViewController.NavigationBar"
    }
    
    var testCase: XCTestCase
    var photosCollectionViewPage: PhotosCollectionViewPage
    
    
    // MARK:- UI elements
    
    var navBarBackButton: XCUIElement { return app.navigationBars.buttons.firstMatch }
    
    
    // MARK:- Interactions
    
    @discardableResult func tapOnBackButton() -> PhotosCollectionViewPage {
        
        navBarBackButton.tap()
        
        return PhotosCollectionViewPage(testCase: testCase)
    }
    
}
