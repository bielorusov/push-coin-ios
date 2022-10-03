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
  
  @State private var maxDist: Double = 100.0
  
  let minDist = 10.0
//  let maxDist = 50.0
  
  var body: some View {
  let countVisiblePoints = sortedCoinPoints.count - 1
    
    ZStack {
      if sortedCoinPoints.count > 0 {
        ForEach(0...countVisiblePoints, id: \.self) {
          CoinPointView(
            coinPointM: sortedCoinPoints[$0],
            motionManager: motionManager,
            locationManager: locationManager,
            minDist: minDist,
            maxDist: $maxDist,
//            minDist: sortedCoinPoints[0].distance(from: locationManager.coordinate2D),
//            maxDist: sortedCoinPoints[countVisiblePoints].distance(from: locationManager.coordinate2D),
            isNearest: $0 == countVisiblePoints
          )
        }
      }
      
      VStack {
        Spacer()
        Text("Distance: \(maxDist.asAmountString) m.")
            .foregroundColor(.white)
        Text("\(sortedCoinPoints.count) coins found.")
            .foregroundColor(.white)
        
        Slider(value: $maxDist, in: 0...500)
      }.offset(y: -120)
      
//      VStack {
//        Text("Alt: \(locationManager.altitude.asAmountString) m.")
//        Text("GravityZ: \(motionManager.gravityZ)")        
//      }
    }
  }
}

extension PointsVisionView {
  private var sortedCoinPoints: [CoinPointModel] {
    let currentLocation = locationManager.coordinate2D
    let points = CoinPointModel.points
    
    let sortedCoins = points.filter { coinM in
      (0...maxDist).contains(coinM.distance(from: currentLocation))
    }.sorted {
      $0.distance(from: currentLocation) > $1.distance(from: currentLocation)
    }
    
    return sortedCoins
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
