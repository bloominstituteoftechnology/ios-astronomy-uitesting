//
//  Springboard+Uninstall.swift
//  AstronomyUITests
//
//  Created by Michael Redig on 6/13/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class Springboard {

	static let springboard = XCUIApplication(bundleIdentifier: "com.apple.springboard")

	/**
	Terminate and delete the app via springboard
	*/
	class func deleteMyApp() {
		XCUIApplication().terminate()

		// Force delete the app from the springboard
		let icon = springboard.icons["Astronomy"]
		if icon.exists {
			let iconFrame = icon.frame
			let springboardFrame = springboard.frame
			icon.press(forDuration: 1.3)

			// Tap the little "X" button at approximately where it is. The X is not exposed directly
			springboard.coordinate(withNormalizedOffset: CGVector(dx: (iconFrame.minX + 3) / springboardFrame.maxX, dy: (iconFrame.minY + 3) / springboardFrame.maxY)).tap()
			sleep(1)
			springboard.alerts.buttons["Delete"].tap()
		}
	}
}

