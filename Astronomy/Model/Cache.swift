//
//  PhotoCache.swift
//  Astronomy
//
//  Created by Andrew R Madsen on 9/5/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class Cache<Key: Hashable, Value> {
    
    // ASYNC. It doesn't need to be synchronous. We're saying add it to the cache whenever you're available
    func cache(value: Value, for key: Key) { // Get key and value pair
        queue.async {
            self.cache[key] = value // Add them to the dictionary
        }
    }
    
    // SYNC. Finding should be synchronously
    func value(for key: Key) -> Value? { // Get key and return a value
        return queue.sync { cache[key] } // Find the value related to the key and return it
    }
    
    // ASYNC. Also when we clear cache. We say add it to queue and do the work whenever good for you.
    func clear() {
        queue.async {
            self.cache.removeAll() // Remove everything inside the dictionary. Make it empty
        }
    }
    
    private var cache = [Key : Value]() // We'll hold all cache in this dictionary. This is our cache data source
    private let queue = DispatchQueue(label: "com.LambdaSchool.Astronomy.CacheQueue") // This is the personal queue for the cache. It makes cache task thread safe. So we define the queue ourselves
}
