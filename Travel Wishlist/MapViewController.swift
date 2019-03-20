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
    var tableView: VisitedLocations!
    var thelocation: Location!
    
    var myLocations: [Location] = []
    
    var loc: [Location] = [] {
        didSet {
            myLocations = loc
        }
    }
    
    
    
    

    
    
    
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
        
        // Sets the initial View of the map
        
        let aLocation = CLLocationCoordinate2D(latitude: CLLocationDegrees(44.9765), longitude: CLLocationDegrees(-93.2761))
        let span = MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)
        let regin = MKCoordinateRegion(center: aLocation, span: span)
        mapView.setRegion(regin, animated: true)
        
        
        
    }
    
    // Button that adds a place
    
    @IBAction func addAPlace(_ sender: Any) {
        
        
        self.myLocations.append(thelocation)
        print(myLocations)
        
    
    }
    // This switches the color of the pins when selected
//        func mapView(_mapView: MKMapView, didSelect view: MKAnnotation) {
//            if let view = view as? MKPinAnnotationView {
//                view.pinTintColor = UIColor.yellow
//            }
//        }

    
 
    
    @IBAction func showDetail(_ sender: UIButton) {
        
        performSegue(withIdentifier: "showDetail", sender: sender)
    }
    
    @objc func handleTap (_ gestureRecognizer: UITapGestureRecognizer) {
        let location = gestureRecognizer.location(in: mapView)
        let coordinate = mapView.convert(location, toCoordinateFrom: mapView)
        if let myLocation = locationManager.location {
            let annotation = MKPointAnnotation()
            annotation.coordinate = myLocation.coordinate
            
            
            let aLocation = CLLocationCoordinate2D(latitude: CLLocationDegrees(coordinate.latitude), longitude: CLLocationDegrees(coordinate.longitude))
            let span = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            let regin = MKCoordinateRegion(center: aLocation, span: span)
            mapView.setRegion(regin, animated: true)
            
            // This displays the location below the placemark in an address format
            geoCoder.reverseGeocodeLocation(CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude), completionHandler: { (placeMarks: [CLPlacemark]?, error: Error?) in
                
                if let placeMark = placeMarks?[0] {
                    
                if error == nil {
                    
                    self.reverseGeocodeComplete(location: placeMark)
                    let placeName = placeMark.name ?? ""
                    let placeDetail = placeMark.thoroughfare ?? ""
                    
                    
                    // Adds locations to the model
                    DispatchQueue.main.async {
        
                        
                        self.locationString = "\(placeName)"
                        //var newLocation = Location(name: self.locationString, visited: false)
                        //self.locationStore.add(newLocation)
                        
                        let newPlace = Location(locationName: self.locationString, locationDetail: placeDetail)
                        self.thelocation = newPlace
                        
                    
                        
                    }
                        
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
    
    
    
    // This checks if authorization has been granted and displays a message if not
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = false
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
    
    // This sends new places to the table view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            //let name = locationStore.createLocation()
            let detailView = segue.destination as! VisitedLocations
            detailView.loc = myLocations
            //print(name)
            
            
            
            
        }
    }
    
    
    }





