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
  @State private var mapType: MKMapType = .standard
  
  var body: some View {
    let location = self.locationManager.location != nil ? self.locationManager.location : CLLocation()
    let coordinate = location!.coordinate
    let magneticHeading = self.locationManager.magneticHeading
    let camera = MKMapCamera(lookingAtCenter: coordinate, fromDistance: 300, pitch: 0 , heading: magneticHeading)
    
    return ZStack {
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
}

struct MapPageView_Previews: PreviewProvider {
  static var previews: some View {
    MapPageView()
  }
}
