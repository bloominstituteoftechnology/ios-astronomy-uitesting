//
//  PhotoDetailTestPage.swift
//  AstronomyUITests
//
//  Created by Yvette Zhukovsky on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoDetailTestPage:TestPage {
    
    var testCase: XCTestCase
   
     var PhotoCollectionTestPage: PhotoCollectionTestPage
    
    //Elements
    
    private  var saveButton: XCUIElement {
        
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
        
    }
    
    private  var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.cameraLabel"]
    }
    
   private var backButton: XCUIElement {
    return app.navigationBars.buttons.firstMatch
    }
    
    //Interactions
    
    
    @discardableResult func tapSavePhoto() ->PhotoDetailTestPage {
        saveButton.tap()
        return self
    }
    
    @discardableResult func alertButton() ->PhotoDetailTestPage {
        
        let alert = app.alerts.buttons["Okay"]
        alert.tap()
        return self
    }
    
    
   
    
    @discardableResult func goBack() -> PhotoCollectionTestPage {
        backButton.tap()
        return PhotoCollectionTestPage
    }
    
    //Verifications
    
    @discardableResult func savedAlert() -> PhotoDetailTestPage {
        
        let anotherAlert = app.alerts["Photo Saved!"]
        XCTAssert(anotherAlert.exists)
        app.tap()
        return self
    }
    
    
    @discardableResult func checkingLabel()-> PhotoDetailTestPage {
        XCTAssert(cameraLabel.exists)
        return self
    }
    
    
    
}
