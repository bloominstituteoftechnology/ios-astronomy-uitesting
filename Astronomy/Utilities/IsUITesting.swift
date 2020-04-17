//
//  IsUITesting.swift
//  Astronomy
//
//  Created by Spencer Curtis on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

var isUITesting: Bool {
    print("CommandLine.arguments: \(CommandLine.arguments)")
    
    /// contains works like containsAbsolute
    /// In Xcode scheme you just have to put UITesting and an added argument. launchArguments is implied.
    let uitesting = CommandLine.arguments.contains("UITesting")
    print("contains(\"UITesting\") = \(uitesting)")
    return uitesting
}
