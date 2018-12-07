//
//  PhotoCollectionTestPage.swift
//  AstronomyUITests
//
//  Created by Yvette Zhukovsky on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest


struct PhotoCollectionTestPage: TestPage {
    
     var testCase: XCTestCase
    
    //Elements
 

    
    var previouskButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    
    
    var nextButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    func cellAt(index: Int)-> XCUIElement {
        return app.collectionViews.cells.element(boundBy: index)
    }
    
    
    
        //Interactions
        
    
    
    
    @discardableResult func tapNextSol() -> PhotoCollectionTestPage {
     nextButton.tap()
        return self
    }
    
    @discardableResult func tapPreviousSol() -> PhotoCollectionTestPage {
       

        previouskButton.tap()
        return self
    }
    
    
    @discardableResult func tapOnCell(at index: Int)-> PhotoDetailTestPage {
        cellAt(index: index).tap()
        return PhotoDetailTestPage(testCase: testCase, PhotoCollectionTestPage: self )
    }
    
   
    @discardableResult func swipingUP() ->PhotoCollectionTestPage{
       app.swipeUp()
       
        return self
    }
    
    @discardableResult func swipingDown() ->PhotoCollectionTestPage{
        app.swipeDown()
        
        return self
    }
    
    
        
  //Verification - This is where you will make yyour assertions(mostly) in order to verify state and/or behavior
        
    @discardableResult func verifyTitle(forNumberSol Sol: Int)-> PhotoCollectionTestPage {
        
        XCTAssertNotNil(app.navigationBars)
        return self
    }
    
    
    
    
}
