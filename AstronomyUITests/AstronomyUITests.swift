
import XCTest

class AstronomyUITests: XCTestCase {
   
    var photosCollection: PhotosCollection!
    
    var photoDetail: PhotoDetail!
    
//    var solDescription: SolDescription!
//
//    var sol = solDescription.sol
    
    override func setUp() {

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // Constant for the application
        let app = XCUIApplication()
        
        // This string is the launch argument that the app will look for to know it's using local data rather than making network calls
        app.launchArguments = ["UITesting"]
        
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    // MARK: Element Existence
    
    func testInitialState() {

        // PHOTOS COLLECTION
        // verify label exists
        XCTAssertTrue(photosCollection.titleLabel.exists)
//        XCTAssertEqual(photosCollection.titleLabel.label, "Sol \(solDescription?.sol ?? 0)")
        
        // verify buttons exist
        XCTAssertTrue(photosCollection.previousButton.exists)
        XCTAssertTrue(photosCollection.nextButton.exists)
        
        // verify image exists
        XCTAssertTrue(photosCollection.imageView.exists)
        
        // PHOTO DETAIL
        // verify back button exists
        XCTAssertTrue(photoDetail.backButton.exists)
        
        // verify labels exist
        XCTAssertTrue(photoDetail.titleLabel.exists)
        XCTAssertTrue(photoDetail.detailLabel.exists)
        XCTAssertTrue(photoDetail.cameraLabel.exists)
        XCTAssertTrue(photoDetail.cameraDetailLabel.exists)
        
        // verify image exists
        XCTAssertTrue(photoDetail.imageView.exists)
        
        // verify save button exists
        XCTAssertTrue(photoDetail.saveButton.exists)
    }
    
    // MARK: Element Interaction
    
    func testSave() {
        
        // When save button is clicked, I am expecting to see the save alert message if it is successful
        // "The photo has been saved to your Photo Library!"
        
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.buttons["PhotoDetailViewController.SaveButton"]/*[[".buttons[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["“Astronomy” Would Like to Access Your Photos"].buttons["OK"].tap()
        
        
    }

}
