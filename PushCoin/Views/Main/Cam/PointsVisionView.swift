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
  @ObservedObject private var motionManager = MotionManager()
  
  let targetPoint = CoinPointModel.point.coordinate2D
  let targetModel = CoinPointModel.point
  
  var body: some View {
    ZStack {
      if (showCoinPoint()) {
        CoinSequenceView(coinType: "coin")
          .frame(width: 100, height: 100)
          .offset(x: calcXOffset(), y: calcYOffset())
          .animation(.default, value: self.locationManager.magneticHeading)
          .animation(.default, value: self.motionManager.gravityZ)
      }
      
      VStack(alignment: .leading) {
        Text("SCR_W: \(UIScreen.main.bounds.width)")
        Text("SCR_H: \(UIScreen.main.bounds.height)")
        Text("Altitude: \(locationManager.altitude.rounded(to: 2))")
        Text("Distance: \(calcDistance().rounded(to: 2))")
        Text("Bearing: \(calcBearing().rounded(to: 2))")
        Text("Mag Heading: \(locationManager.magneticHeading.rounded(to: 2))")
        Text("DIFF: \(calcDiff().rounded(to: 2))")
      }
    }
  }
}

extension PointsVisionView {
  private func calcDistance() -> Double {
    return targetPoint.distance(from: locationManager.coordinate2D)
  }
  
  private func calcBearing() -> Double {
    return locationManager.coordinate2D.bearing(to: targetPoint)
  }
  
  private func calcDiff() -> Double {
    return calcBearing() - locationManager.trueHeading
  }
  
  private func showCoinPoint() -> Bool {
    return (-60...60).contains(calcDiff())
  }
  
  private func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    
    return (screenHeight * gravityZ).rounded(to: 1)
  }
  
  private func calcXOffset() -> CGFloat {
//    return  (((.pi * (UIScreen.main.bounds.width + 100))/2) * sin(calcDiff().degToRad)).rounded(to: 1)
        return  (UIScreen.main.bounds.width * sin(calcDiff().degToRad)).rounded(to: 1)
  }
}

struct PointsVisionView_Previews: PreviewProvider {
  static var previews: some View {
    PointsVisionView()
  }
}



//      Text("Bearing: \(CLLocationCoordinate2D(latitude: 50.484495, longitude: 30.602959).bearing(to: CLLocationCoordinate2D(latitude: 50.483402, longitude: 30.593668)))")
//        .offset(y: 120)
//
//      Text("NewBearing: \(CLLocationCoordinate2D(latitude: 50.484495, longitude: 30.602959).bearingNew(location: CLLocationCoordinate2D(latitude: 50.483402, longitude: 30.593668)))")
//        .offset(y: 140)

//      Text("Magnetic Heading: \(locationManager.magneticHeading)")
//
//      Text("Bearing: \(getBearing())")
//        .offset(y: 50)
//
//      Text("DIFF: \(locationManager.magneticHeading - getBearing())")
//        .offset(y: 100)

//  private var currentLocation: CLLocationCoordinate2D
  
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.483184, longitude: 30.593733)
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.487512, longitude: 30.603002)
//  let targetPoint = CLLocationCoordinate2D(latitude: 50.487963, longitude: 30.607895)
//  let target = CoinPointModel.points[0]
//Text("True Heading: \(locationManager.trueHeading)")
