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
  
  let minDist = 3.0
  let maxDist = 100.0
  
  let minFrame = 30.0
  let maxFrame = 200.0
  
  let targetPoint = CoinPointModel.arsPoint.coordinate2D
  let targetModel = CoinPointModel.arsPoint
  
  var body: some View {
    ZStack {
      if (showCoinPoint()) {
        VStack(spacing: 0) {
          //          Text("\(targetModel.amount.asAmountString) $")
          Text("\(rate())")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundColor(Color.App.gold)
          CoinSequenceView(coinType: "coin")
            .frame(width: calcSize(), height: calcSize())
        }
        .animation(.default, value: self.locationManager.magneticHeading)
        .animation(.default, value: self.motionManager.gravityZ)
        .offset(x: calcXOffset(), y: calcYOffset())
      }
      
      VStack(alignment: .leading) {
        Text("Rate: \(rate())")
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
  private func calcSize() -> Double {
    let size = maxFrame * rate()
    
    return size < minFrame ? minFrame : size
  }
  
  private func rate() -> Double {
    let distance = calcDistance()
    
    switch distance {
      case 0..<minDist:
        return 1
      case minDist...maxDist:
        return 1 - distance/maxDist
      default:
        return 0
    }
  }
  
  private func calcDistance() -> Double {
    let distance = targetPoint.distance(from: locationManager.coordinate2D)
    
    return distance
  }
  
  private func calcBearing() -> Double {
    let bearing =  locationManager.coordinate2D.bearing(to: targetPoint)
    
    return bearing
  }
  
  private func calcDiff() -> Double {
    let diff = calcBearing() - locationManager.trueHeading
    
    return diff
  }
  
  private func showCoinPoint() -> Bool {
    let distance = calcDistance()
    
    return distance <= maxDist && (-60...60).contains(calcDiff())
  }
  
  private func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    let yOffset = (screenHeight * gravityZ).rounded(to: 1)
    
    return yOffset
  }
  
  private func calcXOffset() -> CGFloat {  
    let yOffset = (UIScreen.main.bounds.width * sin(calcDiff().degToRad)).rounded(to: 1)
    
    return yOffset
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
