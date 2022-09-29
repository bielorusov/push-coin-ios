//
//  MapView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
  @Binding var startTracking: Bool
  let camera: MKMapCamera
  let mapType: MKMapType
  let annotations: [MKPointAnnotation]
  
  func makeUIView(context: Context) -> MKMapView {
    let map = MKMapView()
    map.delegate = context.coordinator
    map.showsUserLocation = true
    map.showsCompass = true
    map.showsScale = true
    map.isRotateEnabled = true
    map.setUserTrackingMode(.followWithHeading, animated: true)
    map.setCamera(camera, animated: false)
    map.addAnnotations(annotations)
    map.mapType = mapType
        
    return map
  }
  
  func makeCoordinator() -> MapViewCoordinator {
    MapViewCoordinator(self)
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
//    uiView.setCamera(camera, animated: false)
//    uiView.removeAnnotations(annotations)
    uiView.addAnnotations(annotations)
    uiView.mapType = mapType
    print("FOLLOWING: \(uiView.userTrackingMode == MKUserTrackingMode.followWithHeading ? "TRUE" : "FALSE")")
  }
}
