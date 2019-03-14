//
//  Location.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 3/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class Location: NSObject {
    var name: String
    var visited: Bool
    
    init(name: String, visited: Bool) {
        self.name = name
        self.visited = visited
        
        super.init()
    }
}
