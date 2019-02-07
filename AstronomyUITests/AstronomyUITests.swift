
import XCTest

class AstronomyUITests: XCTestCase {
    
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

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
