//
//  ViewController.swift
//  Vacations App
//
//  Created by elaheh on 2017-08-17.
//  Copyright © 2017 elaheh. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyDEDZ8ZriyZl1jc5TLUxHvbotfGvPcJxFE")
        
        let camera = GMSCameraPosition.camera(withLatitude: 45.469642, longitude: -73.744781, zoom: 12)
        let mapView = GMSMapView.map(withFrame: CGRect.zero , camera: camera)
        
        view = mapView
         //put marker on the map
        let currentLocation = CLLocationCoordinate2DMake(45.469642, -73.744781)
        let marker = GMSMarker(position: currentLocation)
        
        marker.title = "Montréal Airport (YUL)"
        marker.map = mapView
        
    }

   


}

