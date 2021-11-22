//
//  MapViewController.swift
//  Duality.gg
//
//  Created by Max on 22/11/21.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate  {
    
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapa: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        
        let centro = CLLocationCoordinate2DMake(34.0323531,-118.4573997)
        mapa.region = MKCoordinateRegion(center: centro, latitudinalMeters: 1000, longitudinalMeters: 1000)
        mapa.showsTraffic = true
        mapa.showsScale = true
        mapa.showsCompass = true
        
        let hQ = MKPointAnnotation()
        hQ.coordinate = centro
        hQ.title = "Riota Games HQ"
        hQ.subtitle = "Creator of Valorant"
        mapa.addAnnotation(hQ)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus){
        
        if status == .authorizedWhenInUse{
            //podemos usar la ubicacición del iphone
            locationManager.startUpdatingLocation()
            mapa.showsUserLocation = true
        }else{
            //no podemos usar la ubicación
            locationManager.stopUpdatingLocation()
            mapa.showsUserLocation = false
        }
        
    }

}
