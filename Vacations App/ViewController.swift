//
//  ViewController.swift
//  Vacations App
//
//  Created by elaheh on 2017-08-17.
//  Copyright © 2017 elaheh. All rights reserved.
//

import UIKit
import GoogleMaps


class VacationDestination : NSObject{
    let name : String
    let location : CLLocationCoordinate2D
    let zoom : Float
    init(name:String,location:CLLocationCoordinate2D,zoom:Float) {
        self.name = name
        self.location = location
        self.zoom = zoom
        
    }
}

class ViewController: UIViewController {

    var mapView : GMSMapView?
    var currentDestination : VacationDestination?
    let destinations = [VacationDestination(name: "Old Montreal", location: CLLocationCoordinate2DMake(45.512635, -73.548482), zoom: 15),
        VacationDestination(name: "Notre-Dame Basilica", location: CLLocationCoordinate2DMake(45.504706, -73.556120), zoom: 15),
        VacationDestination(name: "Mont-Royal Chalet", location: CLLocationCoordinate2DMake(45.503930, -73.587335), zoom: 12)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GMSServices.provideAPIKey("AIzaSyDEDZ8ZriyZl1jc5TLUxHvbotfGvPcJxFE")
        
        let camera = GMSCameraPosition.camera(withLatitude: 45.469642, longitude: -73.744781, zoom: 12)
         mapView = GMSMapView.map(withFrame: CGRect.zero , camera: camera)
        
        view = mapView
         //put marker on the map
        let currentLocation = CLLocationCoordinate2DMake(45.469642, -73.744781)
        let marker = GMSMarker(position: currentLocation)
        
        marker.title = "Montréal Airport (YUL)"
        marker.map = mapView
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .plain, target: self, action: #selector(pushNext))
        
    }
    
    
    func pushNext(){
        if currentDestination == nil{
            currentDestination = destinations.first
        
            mapView?.camera = GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom)
            
            let marker = GMSMarker(position: currentDestination!.location)
            marker.title = currentDestination?.name
            marker.map = mapView
        }else{
            if let index = destinations.index(of: currentDestination!){
                currentDestination = destinations[index+1]
                
                mapView?.camera = GMSCameraPosition.camera(withTarget: currentDestination!.location, zoom: currentDestination!.zoom)
                
                let marker = GMSMarker(position: currentDestination!.location)
                marker.title = currentDestination?.name
                marker.map = mapView
            }
        }
        
      
        
        
    }

   


}

