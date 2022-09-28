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
  @Published var magneticHeading: CGFloat = 0.0
  
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
  func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
    self.magneticHeading = CGFloat(newHeading.magneticHeading)
  }
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    
    DispatchQueue.main.async {
      self.location = location
    }
  }  
}
