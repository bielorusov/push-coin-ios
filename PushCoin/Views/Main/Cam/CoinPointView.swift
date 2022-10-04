//
//  CoinPointView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//

import SwiftUI
import MapKit

struct CoinPointView: View {
  let coinPointM: CoinPointModel
  let motionManager: MotionManager
  let locationManager: LocationManager
  
  let minDist: Double
  @Binding var maxDist: Double
//  let maxDist: Double
  
  let minFrame = 30.0
  let maxFrame = 130.0
  
  let minFont = 3.0
  let maxFont = 24.0
  
  let maxPVAngle: Double = 120 // Max Pitch view angle (delta Tangag)
  let maxBVAngle: Double = 120 // Max Bearing view angle (delta Azimuth)
  
  let isNearest: Bool
  
  let screenHeight = UIScreen.main.bounds.height
  
  var body: some View {
    ZStack {
      if (isVisible) {
        VStack(spacing: 0) {
//          Text("\(coinPointM.title)")
//            .font(Font.appFont(size: calcFontSize()))
//            .fontWeight(.bold)
//            .foregroundColor(.white)
          
//          Text("\(deltaHeightOffset.asAmountString)")
//            .font(Font.appFont(size: calcFontSize()))
//          Text("El: \(coinPointM.elevation.asAmountString) m.")
//              .font(Font.appFont(size: calcFontSize()))
//          Text("Distance: \(calcDistance().asAmountString)")
//            .font(Font.appFont(size: calcFontSize()))
          
          Text("DIST: \(distance2D.asAmountString)")
            .font(Font.appFont(size: fontSize))
            .foregroundColor(.white)
          
          getCoinView(coinType: coinPointM.coinType)
            .frame(width: frameSize, height: frameSize)
          
          Text("P2PD: \(distanceP2P.asAmountString)")
            .font(Font.appFont(size: fontSize))
            .foregroundColor(.red)
          
          Text("DH Offset: \(deltaHeightOffset.asAmountString)")
            .font(Font.appFont(size: fontSize))
            .foregroundColor(.green)
//          Text("Alt: \(locationManager.altitude.asAmountString) m.")
//            .font(Font.appFont(size: fontSize))
//            .foregroundColor(.red)
          Text("FullH: \(coinPointM.fullHeight.asAmountString) m.")
            .font(Font.appFont(size: fontSize))
            .foregroundColor(.red)
//          Text("Size: \(calcSize().asAmountString) px.")
//            .font(Font.appFont(size: calcFontSize()))
//            .foregroundColor(.red)
//          Text("Alt + H: \(coinPointM.fullHeight.asAmountString) m.")
//            .font(Font.appFont(size: calcFontSize()))
//            .foregroundColor(.red)
        }
        .animation(.default, value: locationManager.magneticHeading)
        .animation(.default, value: motionManager.gravityZ)
        .offset(x: xOffset, y: yOffset)
      }
    }
  }
}

extension CoinPointView {
  
  @ViewBuilder
  func getCoinView(coinType: String) -> some View {
    if isNearest {
      // Rotate coin
        CoinSequenceView(coinType: coinType)
    } else {
      // Show static coin with opacity by rate
      Image(String(format: "\(coinType)_%05d", 10))
        .resizable()
        .opacity(isNearest ? 1 : rate)
    }
  }
  
  //  Delta hight in meters
  private var deltaHeight: Double {
    locationManager.altitude -  coinPointM.height - coinPointM.alt
  }
  
  private var deltaHeightOffset: Double {
    let delta = (2 * distance2D * tan((maxPVAngle/2).degToRad) * deltaHeight) / screenHeight
    
    return delta
  }
  
  private var fontSize: CGFloat {
    return CGFloat(maxFont * rate)
//    return CGFloat(fontSize < minFont ? minFont : fontSize)
  }
  
  private var frameSize: Double {
    return maxFrame * rate
  }
  
  private var rate: Double {
//    let distance = calcDistance()
    
    switch distanceP2P {
      case 0..<minDist:
        return 1
      case minDist...maxDist:
        return 1 - distanceP2P/maxDist
      default:
        return 0
    }
  }
  
  private var distanceP2P: Double {
    sqrt(pow(distance2D, 2) + pow(deltaHeight, 2))
  }
  
  private var distance2D: Double {
    return coinPointM.distance(from: locationManager.coordinate2D)
  }
  
  private var bearing: Double {
    return locationManager.coordinate2D.bearing(to: coinPointM.coordinate2D)
  }
  
  private var bearingDiff: Double {
    return bearing - locationManager.trueHeading
  }
  
  private var isVisible: Bool {
    let distance = distance2D
   // Need to set || instead && for showing Coin Anyway from 0...minDist
    return distance <= maxDist && (-60...60).contains(bearingDiff)
  }
  
  private var yOffset: CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    let yOffset = (screenHeight * gravityZ) + .pi * deltaHeightOffset
    
    return yOffset
  }
  
  private var xOffset: CGFloat {
    let distance = distance2D
    let xOffset = (UIScreen.main.bounds.width * sin(bearingDiff.degToRad)).rounded(to: 1)
    
    return distance < minDist ? 0.0 : xOffset
  }
}

struct CoinPointViewView_Previews: PreviewProvider {
//  @State static var maxDist = 50
  
  static var previews: some View {
    CoinPointView(coinPointM: CoinPointModel.points[0], motionManager: MotionManager(), locationManager: LocationManager(), minDist: 3, maxDist: .constant(50), isNearest: true)
  }
}



//            .foregroundColor(Color.App.gold)
//          CoinSequenceView(coinType: coinPointM.coinType)

//          Text("\(targetModel.amount.asAmountString) $")

//      VStack(alignment: .leading) {
//        Text("Rate: \(rate())")
//        Text("SCR_W: \(UIScreen.main.bounds.width)")
//        Text("SCR_H: \(UIScreen.main.bounds.height)")
//        Text("Altitude: \(locationManager.altitude.rounded(to: 2))")
//        Text("Distance: \(calcDistance().rounded(to: 2))")
//        Text("Bearing: \(calcBearing().rounded(to: 2))")
//        Text("Mag Heading: \(locationManager.magneticHeading.rounded(to: 2))")
//        Text("DIFF: \(calcDiff().rounded(to: 2))")
//      }
