//
//  PointsVisionView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

import SwiftUI

struct PointsVisionView: View {
  @ObservedObject private var locationManager = LocationManager()
  @ObservedObject private var motionManager = MotionManager()
  
  let minDist: Double = 3.0
  @State private var maxDist: Double = 200.0
  
    var body: some View {
    ZStack {
      if sortedCoinPoints.count > 0 {
        ForEach(0...lastSortedIndex, id: \.self) {
          CoinPointView(
            coinPointM: sortedCoinPoints[$0],
            motionManager: motionManager,
            locationManager: locationManager,
            minDist: minDist,
            maxDist: $maxDist,
            isNearest: $0 == lastSortedIndex
          )
        }
      }
      
      VStack {
        Spacer()
        Slider(value: $maxDist, in: 0...500)
      }.offset(y: -120)
    }
  }
}

extension PointsVisionView {
  private var lastSortedIndex: Int {
    sortedCoinPoints.count - 1
  }
   
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
