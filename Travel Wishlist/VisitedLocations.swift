//
//  VisitedLocations.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 3/5/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit

class VisitedLocations: UITableViewController {

        
    
    override func viewDidLoad() {
        super .viewDidLoad()
        
    }
    
    var locationStore: LocationStore!
    var location: Location!
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let location = locationStore.getLocation(at: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitedLocations", for: indexPath)
        cell.textLabel?.text = location!.name
        //cell.detailTextLabel!.text = "\(coordinate)"
        return cell
    }
    
    
}
