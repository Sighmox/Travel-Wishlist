//
//  LocationStore.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 3/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class LocationStore {
    
    var allLocations = [Location]()
    
    func add(_ location: Location) -> Int {
        allLocations.append(location)
        return allLocations.endIndex - 1
    }
    
    func getLocation(at index: Int) -> Location? {
        if allLocations.indices.contains(index) {
            return allLocations[index]
        }
        return nil
    }
    
    func count() -> Int {
        return allLocations.count
    }
    
    @discardableResult func createLocation() -> Location {
        let newLocation = Location(name: "home", visited: true)
        
        allLocations.append(newLocation)
        
        return newLocation
    }
    
    func removeLocation(_ location: Location) {
        if let index = allLocations.index(of: location) {
            allLocations.remove(at: index)
        }
    }
    
    func moveLocation(from fromIndex: Int, to toIndex: Int) {
        if fromIndex == toIndex {
            return
        }
        
        // Get reference to object being moved so you can reinsert it
        let movedLocation = allLocations[fromIndex]
        
        // Remove location from array
        allLocations.remove(at: fromIndex)
        
        // Insert location in array at new spot
        allLocations.insert(movedLocation, at: toIndex)
    }
}
