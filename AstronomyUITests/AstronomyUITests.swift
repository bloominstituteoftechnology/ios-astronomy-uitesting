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
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launchArguments = ["UITesting"]
        app.launch()
    }

    // MARK: - Tests
    
    func testSavingAPhoto() throws {
        navigateToSol("Sol 14")
        viewPhotoDetail(atIndex: 0)
        
        app/*@START_MENU_TOKEN@*/.staticTexts["Save to Photo Library"]/*[[".buttons[\"Save to Photo Library\"].staticTexts[\"Save to Photo Library\"]",".buttons[\"PhotoDetailViewController.SaveButton\"].staticTexts[\"Save to Photo Library\"]",".staticTexts[\"Save to Photo Library\"]"],[[[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let elementsQuery = app.alerts["Photo Saved!"].scrollViews.otherElements
        let alertTitle = elementsQuery.staticTexts["Photo Saved!"].label
        let alertSubtext = elementsQuery.staticTexts["The photo has been saved to your Photo Library!"].label
        
        XCTAssertEqual(alertTitle, "Photo Saved!")
        XCTAssertEqual(alertSubtext, "The photo has been saved to your Photo Library!")
        
        elementsQuery.buttons["Okay"].tap()
    }
    
    func testViewingNextSol() throws {
        assertCurrentSolEquals(expectedSol: "Sol 1")
        navigateToNextSol()
        assertCurrentSolEquals(expectedSol: "Sol 2")
    }
    
    func testViewingPreviousSol() throws {
        try testViewingNextSol()
        navigateToPreviousSol()
        assertCurrentSolEquals(expectedSol: "Sol 1")
    }
    
    func testPhotoDetailViewData() throws {
        navigateToSol("Sol 16")
        viewPhotoDetail(atIndex: 0)
        
        let expectedPhotoDetails = "Taken by 5 on 8/21/12, 8:00 PM (Sol 16)"
        let expectedCameraDetails = "Front Hazard Avoidance Camera"
        
        let photoDetails = app.staticTexts["PhotoDetailViewController.PhotoDetailsLabel"].label
        let cameraDetails = app.staticTexts["PhotoDetailViewController.CameraLabel"].label
                
        XCTAssertEqual(photoDetails, expectedPhotoDetails)
        XCTAssertEqual(cameraDetails, expectedCameraDetails)
    }
    
    func testPhotoDetailViewNavigation() throws {
        navigateToSol("Sol 14")
        
        viewPhotoDetail(atIndex: 0)
        navigateBackToCollectionView()
        assertCurrentSolEquals(expectedSol: "Sol 14")

        viewPhotoDetail(atIndex: 1)
        navigateBackToCollectionView()
        assertCurrentSolEquals(expectedSol: "Sol 14")
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
    
    // Only 3 sols (sols 14-16) are available for viewing during testing
    private enum ViewableSols: String {
        case sol14 = "Sol 14"
        case sol15 = "Sol 15"
        case sol16 = "Sol 16"
    }
    
    private var currentSol: String { sols[indexOfCurrentSol] }
    
    // MARK: - Helper Methods
    
    private func navigateToNextSol() {
        app.navigationBars[currentSol].buttons["PhotosCollectionViewController.NextSolButton"].tap()
        indexOfCurrentSol += 1
    }
    
    private func navigateToPreviousSol() {
        app.navigationBars[currentSol].buttons["PhotosCollectionViewController.PreviousSolButton"].tap()
        indexOfCurrentSol -= 1
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
    
    private func navigateToFirstViewableSol() {
        navigateToSol("Sol 14")
    }
    
    private func viewPhotoDetail(atIndex collectionItemIndex: Int) {
        app.collectionViews.children(matching: .cell).element(boundBy: collectionItemIndex).otherElements.containing(.image, identifier:"ImageCell.ImageView").element.tap()
    }
    
    private func navigateBackToCollectionView() {
        app.navigationBars["Title"].buttons[currentSol].tap()
    }
    
    private func assertCurrentSolEquals(expectedSol: String) {
        let sol = app.navigationBars[expectedSol].staticTexts[expectedSol].label
        XCTAssertEqual(sol, expectedSol)
    }
    
}
