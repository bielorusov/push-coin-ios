//
//  PointsVisionView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

import SwiftUI
import MapKit

struct PointsVisionView: View {
  @ObservedObject private var locationManager = LocationManager()
  @ObservedObject private var motionManager: MotionManager = MotionManager()
  
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.483184, longitude: 30.593733)
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.487512, longitude: 30.603002)
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.487963, longitude: 30.607895)
  
  let targetPoint = CoinPointModel.points[0].coordinate2D
  
  var body: some View {
    ZStack {
      if (showCoinPoint()) {
        CoinSequenceView(coinType: "coin")
          .frame(width: 200, height: 200)
          .offset(x: calcXOffset(), y: calcYOffset())
          .animation(.default, value: self.locationManager.magneticHeading)
          .animation(.default, value: self.motionManager.gravityZ)
      }
      
//      Text("Magnetic Heading: \(locationManager.magneticHeading)")
//
//      Text("Bearing: \(getBearing())")
//        .offset(y: 50)
//
//      Text("DIFF: \(locationManager.magneticHeading - getBearing())")
//        .offset(y: 100)
    }
  }
}

extension PointsVisionView {  
  private func getBearing() -> Double {
    let location = self.locationManager.location != nil ? self.locationManager.location : CLLocation()
    let coordinate = location!.coordinate
    let currentLocation = CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    
    return currentLocation.bearing(location: targetPoint)
  }
  
  private func showCoinPoint() -> Bool {
    let direct = locationManager.magneticHeading - getBearing()
    // let radDirect = locationManager.magneticHeading.degToRad - .pi
    // return ((-.pi/4)...(.pi/4)).contains(radDirect)
    
    return (-45...45).contains(direct)
  }
  
  private func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    
    return (screenHeight * gravityZ).rounded(to: 1)
  }
  
  private func calcXOffset() -> CGFloat {
    let direct = locationManager.magneticHeading - getBearing()
    
    return -1 * (((.pi * (UIScreen.main.bounds.width + 100))/2) * sin(direct.degToRad)).rounded(to: 1)
  }
}


struct PointsVisionView_Previews: PreviewProvider {
  static var previews: some View {
    PointsVisionView()
  }
}


//      Text("x: \(motionManager.roll.rounded(to: 2)) y: \(motionManager.pitch.rounded(to: 2)) z: \(motionManager.yaw.rounded(to: 2))")

//      Text("x: \(motionManager.gravityX.rounded(to: 2)) y: \(motionManager.gravityY.rounded(to: 2)) z: \(motionManager.gravityZ.rounded(to: 2))")
//        .offset(y: 60)

//      Text("\(calcXOffset()) => \(showCoinPoint() ? "TRUE" : "FALSE")")
//      Text("\(locationManager.magneticHeading.degToRad)")
//        .offset(y: 60)

//      Text("\(locationManager.magneticHeading.rounded() - 180)")
