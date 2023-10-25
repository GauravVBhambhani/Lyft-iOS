//
//  MapViewController.swift
//  RideSharer
//
//  Created by Gaurav Bhambhani on 10/25/23.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        checkLocationServices()
        
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            checkAuthStatus()
        }
    }

    func checkAuthStatus() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            
        case .denied:
            let deniedAlert = UIAlertController(title: "You have not shared your location!", message: "In order for your driver to get to you, we need to access your location.", preferredStyle: .alert)
            deniedAlert.addAction(UIAlertAction(title: "OK", style: .cancel))
            self.present(deniedAlert, animated: true)
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            mapView.showsUserLocation = true
            
        case .restricted: break
            
        case .authorizedAlways:
            mapView.showsUserLocation = true
        }
    }
}
