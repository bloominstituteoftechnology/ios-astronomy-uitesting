
import Foundation
import XCTest

struct PhotoDetail: TestPage {
    
    var testCase: XCTestCase
    
    var backButton: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.backButton"]
    }
    
    var titleLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.title"]
    }
    
    var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.detailLabel"]
    }
    
    var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.cameraLabel"]
    }
    
    var cameraDetailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.cameraDetailLabel"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
}
