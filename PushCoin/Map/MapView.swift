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
    map.mapType = mapType
    map.setUserTrackingMode(.followWithHeading, animated: false)
    map.setCamera(camera, animated: true)
    
    // Add Annotations
    for annotation in annotations {
      map.addAnnotation(annotation)
    }
    
    return map
  }
  
  func makeCoordinator() -> MapCoordinator {
    MapCoordinator(self)
  }
  
  func updateUIView(_ uiView: MKMapView, context: Context) {
    uiView.mapType = mapType
    
    print("FOLLOWING: \(uiView.userTrackingMode == MKUserTrackingMode.followWithHeading ? "TRUE" : "FALSE")")
  }
}
