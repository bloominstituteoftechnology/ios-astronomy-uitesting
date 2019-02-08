
import XCTest

class AstronomyUITests: XCTestCase {
   
    // MARK: - Properties
    
    var app: XCUIApplication!
    
    // Photos Collection View Controller
    
    var collectionViewController: XCUIElement {
        return app.collectionViews["PhotosCollectionView"]
    }
    
    var previousButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    var collectionImageView: XCUIElement {
        return app.images["PhotosCollectionViewController.imageView"]
    }
    
    // Photo Detail View Controller
    
    var detailImageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.detailLabel"]
    }
    
    var detailCameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.cameraLabel"]
    }
    
    var detailCameraInfoLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.cameraDetailLabel"]
    }
    
    var detailSaveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    override func setUp() {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        app = XCUIApplication()
        
        // This string is the launch argument that the app will look for to know it's using local data rather than making network calls
        app.launchArguments = ["UITesting"]
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    // MARK: Element Existence
    
    func testCollectionView() {
        
        let collectionView = app.collectionViews["PhotosCollectionView"]
        
        // verify label exists
        //XCTAssertTrue(collectionTitleLabel.exists)
        XCTAssertTrue(collectionViewController.exists)
        XCTAssertTrue(previousButton.exists)
        XCTAssertTrue(nextButton.exists)
        
        let firstCell = collectionView.cells.element(boundBy: 0)
        
        firstCell.tap()
    }
    
    func testDetailView() {
        
        let collectionView = app.collectionViews["PhotosCollectionView"]
        let firstCell = collectionView.cells.element(boundBy: 0)
        firstCell.tap()
        
        // verify labels exist
        XCTAssertTrue(detailLabel.exists)
        XCTAssertTrue(detailCameraLabel.exists)
        XCTAssertTrue(detailCameraInfoLabel.exists)
        
        // verify image exists
        XCTAssertTrue(detailImageView.exists)
        
        // verify save button exists
        XCTAssertTrue(detailSaveButton.exists)
    }
    
    // MARK: Element Interaction
    
    func testSavePhoto() {
        
        // When save button is clicked, I am expecting to see the save alert message if it is successful
        // "The photo has been saved to your Photo Library!"
        
        // Tap on 3rd cell
        app.collectionViews["PhotosCollectionView"].children(matching: .cell).element(boundBy: 3).otherElements.containing(.image, identifier:"PhotosCollectionViewController.imageView").element.tap()
        
        // Tap Save Button
        app/*@START_MENU_TOKEN@*/.buttons["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[1]]@END_MENU_TOKEN@*/.tap()
        
        // Alert pops up and user taps okay
        app.alerts["Photo Saved!"].buttons["Okay"].tap()
    }
    
    func testNextSol() {
        
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.NextSolButton"]/*[[".buttons[\">\"]",".buttons[\"PhotosCollectionViewController.NextSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        //XCTAssert(app.collectionViews.staticTexts.matching(NSPredicate(format: "Sol 2")).allElementsBoundByIndex(0))
    }
    
    func testPreviousSol() {
        
        app.navigationBars["Sol 2"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Sol 1"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    }

}
