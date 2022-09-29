//
//  MapPageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI
import MapKit

struct MapPageView: View {
  @ObservedObject private var locationManager = LocationManager()
  @State private var startTracking: Bool = true
  @State private var mapType: MKMapType = .standard // .hybrid
  
  var body: some View {    
    MapView(
      startTracking: $startTracking,
      camera: camera,
      mapType: mapType,
      annotations: CoinPointModel.points.map { $0.mkPointAnotation }
    )
      .edgesIgnoringSafeArea(.all)
      .gesture(TapGesture().onEnded {
        self.startTracking.toggle()
        
      })
    
  }
}

extension MapPageView {
  private var lookingAtCenter: CLLocationCoordinate2D {
    self.locationManager.coordinate2D
  }
  
  private var camera: MKMapCamera {
    MKMapCamera(
      lookingAtCenter: lookingAtCenter,
      fromDistance: 100,
      pitch: 0 ,
      heading: locationManager.magneticHeading
    )
  }
}

struct MapPageView_Previews: PreviewProvider {
  static var previews: some View {
    MapPageView()
  }
}
