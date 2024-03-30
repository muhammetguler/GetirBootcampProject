//
//  MapViewController.swift
//  GetirBasicComponents
//
//  Created by Muhammet Guler on 24.03.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var addressLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var lastLocation:CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() { // lokasyon servisleri acik mi degil mi
            setupLocationManager()
            checkLocationServices()
        } else {
            // kullaniciyi ayarlardan konum servisini acmaya yonlendir
        }
        
    }
    
    func checkLocationAuthorization() { // kullanici izin vermis mi vermemis mi
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization() // sorma kismi
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            print("Kullanici izin vermis")
            //TODO: tracking user location
            break
        }
    }
    
    func trackingLocation() {
        mapView.showsUserLocation = true
        showsUserLocationCenterMap()
        locationManager.startUpdatingLocation() // konumu 50 metre de bir isteyebilirsin..
        lastLocation = getCenterLocation(mapView:mapView) // haritanin merkezi benim locationum olur
    }
    
    func showsUserLocationCenterMap() {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getCenterLocation(mapView:MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longtitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longtitude)
        
    }

}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    // bolge degistigi zaman tetiklen
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) {[weak self] placemarks, error in
            guard let self else { return }
            if let error {
                print("HATA")
                return
            }
            
            guard let placemark = placemarks?.first else {return}
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            
            self.addressLabel.text = "\(city) - \(street)"
        }
    }
}
