//
//  ViewController.swift
//  WhereAmI
//
//  Created by Vayunandan reddy Kunduru on 10/17/18.
//  Copyright © 2018 Vayunandan reddy Kunduru. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    
    @IBOutlet weak var MapView: MKMapView!
    let locationManager = CLLocationManager()
    
    @IBAction func SaveButtonClicked(_ sender: Any) {
        let coord = locationManager.location?.coordinate
        
        if let lat = coord?.latitude{
            if let longi = coord?.longitude{
                DataStore().StoreDataPoint(latitude: String(lat), longitude: String(longi))
            }
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let oldCoords = DataStore().GetlastLocation() {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            annotation.coordinate.latitude = Double(oldCoords.latitude)!
            
            annotation.title = "I was here"
            annotation.subtitle = "Remember"
            MapView.addAnnotation(annotation)
        }
    }
}

