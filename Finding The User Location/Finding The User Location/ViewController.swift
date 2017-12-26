//
//  ViewController.swift
//  Finding The User Location
//
//  Created by Wilmer Arteaga on 11/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
//        let latDelta: CLLocationDegrees = 0.05 // zoom
//        let lonDelta: CLLocationDegrees = 0.05
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let region = MKCoordinateRegion(center: location, span: span)
//        self.map.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if error != nil {
                print(error ?? "error")
            } else {
                if let placemark = placemarks?[0] {
                    
                    var country = ""
                    
                    if placemark.country != nil {
                        country = placemark.country!
                    }
                    print(country)
                }
            }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

