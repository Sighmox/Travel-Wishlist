//
//  Location.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 3/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//


// This is the Locations object
import UIKit

class Location : NSObject {
        
        var locationName: String
        var locationDetail: String
        var visited: Bool
        
    init(locationName: String, locationDetail: String, visited: Bool) {
            
            self.locationName = locationName
            self.locationDetail = locationDetail
            self.visited = visited
        }
        
       // super.init()
    }

