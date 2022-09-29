//
//  LocationManager.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import MapKit
import SwiftUI

class LocationManager: NSObject, ObservableObject {
  private let locationManager = CLLocationManager()
  
  @Published var location: CLLocation? = nil
  @Published var magneticHeading: CLLocationDirection = 0.0
  @Published var trueHeading: CLLocationDirection = 0.0
  
  override init() {
    super.init()
    self.locationManager.delegate = self
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
    self.locationManager.distanceFilter = kCLDistanceFilterNone
    self.locationManager.requestWhenInUseAuthorization()
    self.locationManager.startUpdatingLocation()
    self.locationManager.startUpdatingHeading()
  }
}

extension LocationManager: CLLocationManagerDelegate {
  var coordinate2D: CLLocationCoordinate2D {
    let location = self.location != nil ? self.location : CLLocation()
    let coordinate = location!.coordinate
    
    return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
  }
  
  var altitude: CLLocationDistance {
    let location = self.location != nil ? self.location : CLLocation()
    let altitude = location!.altitude
    
    return altitude
  }
  
//  var magneticHeading: CLLocationDirection {
////    let hheading = self.heading != nil ? self.heading : CLHeading()
////    let heading = self.heading != nil ? self.heading : CLHeading()
////    let magneticHeading = heading?.magneticHeading != nil ? heading.magneticHeading : CLLocationDirection()
//
//    return heading.magneticHeading
//  }
  
//  func currentLocationCoordinate() -> CLLocationCoordinate2D {
//    let location = self.location != nil ? self.location : CLLocation()
//    let coordinate = location!.coordinate
//
//    return CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
//  }
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    DispatchQueue.main.async {
      self.trueHeading = newHeading.trueHeading
      self.magneticHeading = newHeading.magneticHeading
    }
  }
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    
    DispatchQueue.main.async {
      self.location = location
    }
  }  
}
