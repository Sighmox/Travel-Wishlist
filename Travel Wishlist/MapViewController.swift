//
//  MapViewController.swift
//  Travel Wishlist
//
//  Created by Paul Baker on 2/27/19.
//  Copyright © 2019 Paul Baker. All rights reserved.
//

import UIKit
import MapKit


class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    

    var locationStore: LocationStore!
    var locationString = String()
    // Adds new locations
    
    
    @IBOutlet weak var mapView: MKMapView!
    //var keyLat: Float = 44.9778
    //var keyLon: Float = -93.2650
    var selectedAnnotation: MKPointAnnotation?
    
    let locationManager = CLLocationManager()
    let geoCoder = CLGeocoder()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        mapView.delegate = self
        
        // This is what tells the programt to recognize taps
        let tapRecogniser = UITapGestureRecognizer(target: self, action:
            #selector(self.handleTap(_:)))
        mapView.addGestureRecognizer(tapRecogniser)
        
        mapView.mapType = MKMapType.standard
        
        //let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(keyLat), longitude: CLLocationDegrees(keyLon))
        //let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        //let regin = MKCoordinateRegion(center: location, span: span)
        //mapView.setRegion(regin, animated: true)
        //let annotation = MKPointAnnotation()
        //annotation.coordinate = location
        //mapView.addAnnotation(annotation)
        
        
        
    }
    
    
    
    
    // Button that adds a place
    
    @IBAction func addAPlace(_ sender: Any) {
        
        let inputAlert = UIAlertController(title: "", message: "Would you like to add this location?",
                                           preferredStyle: .alert)
        inputAlert.addAction(UIAlertAction(title: "Add", style: .default, handler: {(action: UIAlertAction) in
            if self.selectedAnnotation?.coordinate != nil {
                let annotation = self.selectedAnnotation?.coordinate
                _ = annotation
                let newLocation = Location (name: self.locationString, visited: false)
                _ = self.locationStore.add(newLocation)
                //let indexPath = IndexPath(row: index, section: 0)
                //self.tableView.insertRows(at: [indexPath], with: .automatic)
                
            }
        }
        ))
        inputAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(inputAlert, animated: true)
        
    }
 
    
    
    @objc func handleTap (_ gestureRecognizer: UILongPressGestureRecognizer) {
        
        
        
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        if let myLocation = locationManager.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = myLocation.coordinate
            
            let aLocation = CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinate.latitude), longitude: CLLocationDegrees(coordinate.longitude))
            let span = MKCoordinateSpan(latitudeDelta: 0.25, longitudeDelta: 0.25)
            let regin = MKCoordinateRegion(center: aLocation, span: span)
            mapView.setRegion(regin, animated: true)
            
            // This displays the location below the placemark in an address format
            geoCoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude), completionHandler: { (placeMarks: [CLPlacemark]?, error: Error?) in
                if error == nil {
                    let placeMark = placeMarks![0]
                    self.reverseGeocodeComplete(location: placeMark)
                    let placeName = placeMark.name ?? ""
                    
                    
                    
                    DispatchQueue.main.async {
                        self.locationString = "\(placeName)"
                        
                    }
                    
                    
                    
                    
                    
                }
            })
        }
        
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "\(locationString)"
        mapView.addAnnotation(annotation)
    
    }
    
    func reverseGeocodeComplete(location: CLPlacemark) {
        let locationString = "\(String(describing: location.thoroughfare))"
        print(locationString)
        
        
        

    }
    
    
      //  func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
     //   let latValStr : String = String(format: "%0.02f", Float((view.annotation?.coordinate.latitude)!))
    //    let lonValStr : String = String(format: "%0.02f", Float((view.annotation?.coordinate.longitude)!))
    
        
     //   print("latitude: \(latValStr) & longitude: \(lonValStr)")
   // }
    
    
    
    
    // This checks if authorization has been granted and displays a message if not
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
           // moveToCurrentLocation()
        } else {
            let alert = UIAlertController(title: "Can't display location", message: "Please grant permission in settings",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .default,
                                          handler: { (action: UIAlertAction) -> Void in UIApplication.shared.open(URL(string:
                                            UIApplication.openSettingsURLString)!) } ))
            present(alert, animated: true, completion: nil)
        }
        
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let name = locationStore.createLocation()
            let detailView = segue.destination as! VisitedLocations
            detailView.location = name
            print(name)
            
            
            
            
        }
    }
    /*
    func moveToCurrentLocation() {
        if let location = locationManager.location {
            mapView.setCenter(location.coordinate , animated: true)
 
        }
    }
    */
    
    }


