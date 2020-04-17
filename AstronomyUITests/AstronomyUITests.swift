//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by David Wright on 4/15/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    // MARK: - Helper Properties
    
    // List of available sols (only up to 'Sol 16')
    // Only 3 sols (sols 14-16) are available for viewing during UI testing
    private let sols = ["Sol 1",  "Sol 2",  "Sol 3", "Sol 10", "Sol 12", "Sol 13", "Sol 14", "Sol 15", "Sol 16"]
    
    private var indexOfCurrentSol = 0 {
        didSet {
            if indexOfCurrentSol < 0 || indexOfCurrentSol > (sols.count - 1) {
                XCTAssert(false, "Error: Index out of range for sols[\(indexOfCurrentSol)]. Check test code.")
            }
        }
    }
    
    // MARK: - Testing Setup
    
    override func setUpWithError() throws {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments = ["UITesting"]
        app.launch()
        
        guard let firstAvailableSol = sols.first else { return }
        waitForSolToLoad(expectedSol: firstAvailableSol)
    }

    // MARK: - Tests
    
    func testSavingAPhoto() throws {
        navigateToSol("Sol 14")
        showPhotoDetailViewController(forItemIndex: 0)
        
        app.buttons["Save to Photo Library"].tap()
        
        let elementsQuery = app.alerts["Photo Saved!"].scrollViews.otherElements
        let alertTitle = elementsQuery.staticTexts["Photo Saved!"].label
        let alertSubtext = elementsQuery.staticTexts["The photo has been saved to your Photo Library!"].label
        
        XCTAssertEqual(alertTitle, "Photo Saved!")
        XCTAssertEqual(alertSubtext, "The photo has been saved to your Photo Library!")
        
        elementsQuery.buttons["Okay"].tap()
    }
    
    func testViewNextSol() throws {
        assertCurrentSolEquals(expectedSol: "Sol 1")
        
        navigateToNextSol()
        assertCurrentSolEquals(expectedSol: "Sol 2")
    }
    
    func testViewPreviousSol() throws {
        navigateToNextSol()
        assertCurrentSolEquals(expectedSol: "Sol 2")
        
        navigateToPreviousSol()
        assertCurrentSolEquals(expectedSol: "Sol 1")
    }
    
    func testShowPhotoDetailView() throws {
        navigateToSol("Sol 14")
        
        showPhotoDetailViewController(forItemIndex: 0)
        popPhotoDetailViewController()
        assertCurrentSolEquals(expectedSol: "Sol 14")

        showPhotoDetailViewController(forItemIndex: 1)
        popPhotoDetailViewController()
        assertCurrentSolEquals(expectedSol: "Sol 14")
    }
    
    func testPhotoDataInPhotoDetailView() throws {
        navigateToSol("Sol 16")
        showPhotoDetailViewController(forItemIndex: 0)
        
        let expectedPhotoDetails = "Taken by 5 on 8/21/12, 8:00 PM (Sol 16)"
        let expectedCameraDetails = "Front Hazard Avoidance Camera"
        
        let photoDetails = app.staticTexts["PhotoDetailViewController.PhotoDetailsLabel"].label
        let cameraDetails = app.staticTexts["PhotoDetailViewController.CameraLabel"].label
                
        XCTAssertEqual(photoDetails, expectedPhotoDetails)
        XCTAssertEqual(cameraDetails, expectedCameraDetails)
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}



extension AstronomyUITests {
    
    // MARK: - Helper Properties
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var currentSol: String {
        sols[indexOfCurrentSol]
    }
    
    // MARK: - Helper Methods
    
    private func navigateToNextSol() {
        app.navigationBars[currentSol].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        indexOfCurrentSol += 1
        waitForSolToLoad(expectedSol: currentSol)
    }
    
    private func navigateToPreviousSol() {
        app.navigationBars[currentSol].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        indexOfCurrentSol -= 1
        waitForSolToLoad(expectedSol: currentSol)
    }
    
    private func navigateToSol(_ targetSol: String) {
        guard let indexOfTargetSol = sols.firstIndex(of: targetSol) else {
            XCTAssert(false, "Error: targetSol: \"\(targetSol)\" was not found in the sols array. Check test code.")
            return
        }
        
        if indexOfTargetSol == indexOfCurrentSol {
            return
        } else if indexOfTargetSol > indexOfCurrentSol {
            navigateToNextSol()
            navigateToSol(targetSol)
        } else {
            navigateToPreviousSol()
            navigateToSol(targetSol)
        }
    }
    
    private func showPhotoDetailViewController(forItemIndex collectionItemIndex: Int) {
        app.collectionViews.children(matching: .cell).element(boundBy: collectionItemIndex)
            .otherElements.containing(.image, identifier:"ImageCell.ImageView").element.tap()
    }
    
    private func popPhotoDetailViewController() {
        app.navigationBars["Title"].buttons[currentSol].tap()
        waitForSolToLoad(expectedSol: currentSol)
    }
    
    private func assertCurrentSolEquals(expectedSol: String) {
        XCTAssert(app.navigationBars[expectedSol].exists)
    }
    
    private func waitForSolToLoad(expectedSol: String) {
        let maxWaitTimeInSeconds: TimeInterval = 5
        let navigationBar = app.navigationBars[expectedSol]
        let exists = NSPredicate(format: "exists == true")
        let solDidLoadExpectation = expectation(for: exists, evaluatedWith: navigationBar)
        solDidLoadExpectation.expectationDescription = "The navigation bar title should match the expected sol: \"\(expectedSol)\""
        waitForExpectations(timeout: maxWaitTimeInSeconds)
    }
}
