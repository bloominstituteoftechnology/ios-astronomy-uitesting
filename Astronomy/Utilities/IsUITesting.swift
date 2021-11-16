//
//  IsUITesting.swift
//  Astronomy
//
//  Created by Spencer Curtis on 9/11/18.
//  Copyright © 2018 BloomTech. All rights reserved.
//

import UIKit

var isUITesting: Bool {
    return CommandLine.arguments.contains("UITesting")
}
