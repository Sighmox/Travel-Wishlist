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
    
    // Displays the cells that are sent form Visited Locations
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let location = loc[indexPath.row]
        
        cell.textLabel?.text = location.locationName
        cell.detailTextLabel!.text = "\(location.locationDetail)"
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            let place = locationStore.visited[indexPath.row]
//
//            let title = "Visited?"
//            let message = "Have you visited this place?"
//
//            let ac = UIAlertController(title: title,
//                                       message: message,
//                                       preferredStyle: .actionSheet)
//
//            let visitAction = UIAlertAction(title: title, style: .default , handler: nil)
//            ac.addAction(self.backgroundColor = .green)
//
//        }
//    }
    
    
    }
    
    
    
    

