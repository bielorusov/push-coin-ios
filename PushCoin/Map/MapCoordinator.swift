//
//  MapCoordinator.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import MapKit

final class MapCoordinator: NSObject, MKMapViewDelegate {
  var parentMapView: MapView
  
  init(_ parentMapView: MapView) {
    self.parentMapView = parentMapView
  }
  
  func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
    if(parentMapView.startTracking) {
      mapView.setUserTrackingMode(MKUserTrackingMode.followWithHeading, animated: true)
    } else {
      mapView.setUserTrackingMode(MKUserTrackingMode.none, animated: true)
    }
  }
}
