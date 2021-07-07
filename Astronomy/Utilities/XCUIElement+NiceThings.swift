//
//  XCUIElement+NiceThings.swift
//  Astronomy
//
//  Created by Ivan Caldwell on 2/7/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

extension XCUIElementQuery {
    func elements(for identifiers: [String])->  [String: XCUIElemnt] {
        var results: [String: XCUIElement] = [:]
        
        for identifier in identifiers {
            let element = self[identifier]
            results[identifier] = element
        }
        return results
    }
}


class SomeTest: XCTestCase{
    func testFindingTheseLabels() {
        let app = XCUIApplication()
        let labelsKeyedByIdentifier = app.staticTexts.elements(for: ["label1-identifier", "label2-identifer"])
        let label1: XCUIElement = labelsKeyedByIdentifier["label1-identifier"]!
    
        
    }
}
