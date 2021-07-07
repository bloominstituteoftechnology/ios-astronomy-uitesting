//
//  MarsPhoto.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation

/*
 So in the JSON file.
 Photos. First container is an array of dictionaries. And it's name is photos
 Inside of photosContainer we have
    id,
    sol,
    img_src,
    earth_date key names and their values
 
    But we also have 2 other nested container
    Camera. First one. It's a dictionary
    Inside of nested cameraContainer we have
        id,
        name,
        rover_id,
        full_name key names and their values
 
    Rover. Second nested container. And it's also a dictionary
    It has
        id,
        name,
        landing_date,
        launch_date,
        status,
        max_sol,
        max_date,
        total_photos key names and their values.
 
        But inside of the roverContainer we also have a nested array of dictionaries
        Cameras. Nested container
        And it has
            name,
            full_name key names and their values
 */

struct MarsPhotoReference: Codable { // Create a struct. And make it conform Codable
    // Codable actually is a typealias for Decodable & Encodable
    // So when you use Codable as a type, it can convert itself into or out of an external representation
    // Define necessary properties
    let id: Int
    let sol: Int
    let camera: Camera // This is in a nested container so we created another struct for it
    let earthDate: Date
    
    let imageURL: URL
    
    enum CodingKeys: String, CodingKey { // Created an enum for our properties
        // String: represent raw value of the Enumaration
        // CodingKey: is a type that can be used as a key for decoding/encoding
        case id
        case sol
        case camera
        case earthDate
        case imageURL = "imgSrc" // Name of the imageURL's key in json file
    }

    static let dateFormatter: DateFormatter = { // We define our date format  and then modify it inside curly braces
        let formatter = DateFormatter() // First get an instance of DateFormatter
        formatter.locale = Locale(identifier: "en_US_POSIX") // Then localize it for US
        formatter.timeZone = TimeZone(abbreviation: "GMT") // Define timezone as Greenwich Mean Time
        formatter.dateFormat = "yyyy-MM-dd" // Define the date format
        return formatter // And at the end return modified formatter
    }()
    
    static var jsonDecoder: JSONDecoder { // Define a JSONDecoder computer property. Which is decoding instances of a data type from a JSON file
        let result = JSONDecoder() // Create an instance of it and then modify it
        result.keyDecodingStrategy = .convertFromSnakeCase // First define how to decode keys. We want to convert snake_case to camelCase
        result.dateDecodingStrategy = .formatted(dateFormatter) // When you decoding a Date from JSON you can choose its decoding stategy. So we say formate it using our DateFormatter
        return result // Then return the results
    }
}

