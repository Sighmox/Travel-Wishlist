//
//  LocationStore.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 3/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//


// This is the model for Locations
import Foundation
import CoreLocation

class LocationStore : NSObject {
    
    let locationName: Location
    var locationDetail: String { return locationName.locationName }
    
    init(loc: Location) {
        self.locationName = loc
        super.init()
    }
    
    var locationTitle: String? {
        return locationName.locationName
    }
    
    var locationSubTitle: String? {
        return "\(locationName.locationDetail)"
    }
    
    var visited: Bool? {
        return true
    }
    
}

