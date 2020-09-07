//
//  MapManager.swift
//  My Places
//
//  Created by  Mikhail on 22.06.2020.
//  Copyright © 2020  Mikhail. All rights reserved.
//

import UIKit
import MapKit

class MapManager {
    let locationManager = CLLocationManager()
    
    private let regionInMeters = 1000.00
    private var directionsArray : [MKDirections] = []
    private var placeCoordinate : CLLocationCoordinate2D?
    
    func setupPlaceMark(place: Place, mapView: MKMapView ) {
        guard let location = place.location else { return }
        
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(location) { (placemarks, error) in
            if let error = error {
                print(error)
                return
            } else {
                guard let placemarks = placemarks else { return }
                
                let placemark = placemarks.first
                
                let annotation = MKPointAnnotation()
                
                annotation.title = place.name
                annotation.subtitle = place.type
                
                guard let placeMarkLocation = placemark?.location else { return }
                
                annotation.coordinate = placeMarkLocation.coordinate
                self.placeCoordinate = placeMarkLocation.coordinate
                
                mapView.showAnnotations([annotation], animated: true)
                mapView.selectAnnotation(annotation, animated: true)
            }
        }
        
    }
    
    func checkLocationServices(mapView: MKMapView, segueIdentifier: String, closure: () -> ()) {
        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            checkLocationAutorization(mapView: mapView, segueIdentifier: segueIdentifier)
            closure()
        } else {
            // Show alert controller
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                self.showAlert(title: "Location services are disabled", message: "To enable it go: Settings -> Privacy -> Location Services")
            }
        }
    }
    
    func checkLocationAutorization(mapView: MKMapView, segueIdentifier: String) {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            if segueIdentifier == "GetAddress" { showUserLocation(mapView: mapView) }
        case .denied:
            // Show alert controller
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                           self.showAlert(title: "Location services are disabled", message: "To enable it go: Settings -> Privacy -> My Places")
                       }
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        case .authorizedAlways:
            break
        @unknown default:
            print("New case is avaliable")
        }
    }
    
   func showUserLocation(mapView: MKMapView) {
        if let location = locationManager.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: regionInMeters, longitudinalMeters: regionInMeters)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getDirection(for mapView: MKMapView, previousLocation: (CLLocation) -> ()) {
        
        guard let location = locationManager.location?.coordinate else {
            showAlert(title: "Error", message: "location not found")
            return
        }
        
        locationManager.startUpdatingLocation()
        previousLocation(CLLocation(latitude: location.latitude, longitude: location.longitude))
        
        guard let request = createDirectionRequest(from: location) else {
            showAlert(title: "Error", message: "Destination is not found")
            return
        }
        
        let directions = MKDirections(request: request)
        resetMapView(withNew: directions, mapView: mapView)
        directions.calculate { (response, error) in
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response else {
                self.showAlert(title: "Error", message: "Directions is not avaliable")
                return
            }
                
            for route in response.routes {
                mapView.addOverlay(route.polyline)
                mapView.setVisibleMapRect(route.polyline.boundingMapRect, animated: true)
                
                let distance = String(format: "%.1f", route.distance / 1000)
                let timeInterval = route.expectedTravelTime
                
                print("Distance: \(distance) km.")
                print("Time: \(timeInterval) sec.")
                
            }
            
        }
    }
    
    func createDirectionRequest(from coordinate: CLLocationCoordinate2D) -> MKDirections.Request? {
        guard let destinationCoordinate = placeCoordinate else { return nil }
        let startingLocation = MKPlacemark(coordinate: coordinate)
        let destination = MKPlacemark(coordinate: destinationCoordinate)
        
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: startingLocation)
        request.destination = MKMapItem(placemark: destination)
        request.transportType = .automobile
        request.requestsAlternateRoutes = true
        return request
    }
    
    func startTrackingUserLocation(for mapView: MKMapView, and location: CLLocation?, closure: (_ currentLocation: CLLocation) -> ()) {
        
        guard let previousLocation = location else { return }
        let center = getCenterLocation(for: mapView)
        guard center.distance(from: previousLocation) > 50 else { return }
       
        closure(center)
        
    }

    func resetMapView(withNew directions: MKDirections, mapView: MKMapView) {
        
        mapView.removeOverlays(mapView.overlays)
        directionsArray.append(directions)
        
        let _ = directionsArray.map { $0.cancel() }
        directionsArray.removeAll()
        
    }
    func getCenterLocation(for mapView: MKMapView) -> CLLocation {
        
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .default)
    
        alert.addAction(cancelAction)
        
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
         
        alertWindow.rootViewController?.present(alert, animated: true)
       }
}
