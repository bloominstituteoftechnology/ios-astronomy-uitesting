//
//  TestPage.swift
//  AstronomyUITests
//
//  Created by Enzo Jimenez-Soto on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase {get}
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}



