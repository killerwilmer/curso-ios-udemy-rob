//
//  ViewController.swift
//  Maps
//
//  Created by Wilmer Arteaga on 9/10/17.
//  Copyright © 2017 tinpu. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 27.175244
        let longitude: CLLocationDegrees = 8.0399773
        let latDelta: CLLocationDegrees = 0.05 // zoom
        let lonDelta: CLLocationDegrees = 0.05
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "Taj Mahal"
        annotation.subtitle = "One day I will go here..."
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
    }
    
    @objc func longpress(gestureRecognizer: UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: self.map)
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.title = "New place"
        annotation.subtitle = "Maybe I will go here too..."
        annotation.coordinate = coordinate
        map.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

