

import XCTest
@testable import Astronomy

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication! = XCUIApplication()
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.saveButton"]
    }
    
    var collectionView: XCUIElement {
        return app.collectionViews["PhotosCollectionView"]
    }
    
    var detailView: XCUIElement {
        return app.otherElements["PhotoDetailView"]
    }
    
    var detailViewImageView: XCUIElement {
        return app.otherElements.images["PhotosCollectionViewController.imageView"]
    }
    
    var previousSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var solDescriptionTitle: XCUIElement {
        return app.staticTexts["title"]
    }
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
                if app.state == .notRunning {
                    app.launch()
                } else if app.state != .runningForeground {
                    app.activate()
                }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCollectionView() {
        XCTAssertTrue(collectionView.exists)
        
    }
    
    func testSavePhoto() {
        //Tap on collectionView.image 1 for detail segue
        //FIXME: - Refactor
        app.collectionViews["PhotosCollectionView"].children(matching: .cell).element(boundBy: 1).otherElements.containing(.image, identifier:"PhotosCollectionViewController.imageView").element.tap()
        
        //Save Button
        XCTAssertTrue(saveButton.exists)
        XCTAssertEqual(saveButton.label, "Save to Photo Library")
        saveButton.tap()
        
        
        //Alert popup
        XCTAssertTrue(app.alerts["Photo Saved!"].exists)
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
        XCTAssertFalse(app.alerts["Photo Saved!"].exists)
        
        
    }
    
    func testDetailView() {
        //FIXME: - Refactor
        app.collectionViews["PhotosCollectionView"].children(matching: .cell).element(boundBy: 1).otherElements.containing(.image, identifier:"PhotosCollectionViewController.imageView").element.tap()
        XCTAssertTrue(detailView.exists)
        XCTAssertTrue(detailViewImageView.exists)
        
        //Navigation Bar Back Button - this is way too narrow, only works if done in order. Need to
        //identify generic back button for tap()
        app.navigationBars["Title"].buttons["Sol 15"].tap()
        XCTAssertFalse(detailView.exists)
        XCTAssertTrue(collectionView.exists)
        
    }
    
        func testSolControler() {
        XCTAssertTrue(previousSolButton.exists)
        XCTAssertTrue(nextSolButton.exists)
        //app.navigationBars["Title"].buttons["Sol 14"].tap()
        //FIXME: - Refactor
        XCTAssertTrue(app.navigationBars["Sol 15"].exists)
        previousSolButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 14"].exists)
        nextSolButton.tap()
        nextSolButton.tap()
        XCTAssertTrue(app.navigationBars["Sol 16"].exists)
        
    }
    
}
