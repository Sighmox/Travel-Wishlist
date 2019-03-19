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
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    var locationStore: LocationStore!
    var location: Location!
    var loc: [Location] = []
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return loc.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VisitedLocations", for: indexPath)
        
        let location = loc[indexPath.row]
        
        cell.textLabel?.text = location.name
        //cell.detailTextLabel!.text = "\(coordinate)"
        return cell
    }
    
    
}
