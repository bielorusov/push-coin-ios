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
  let maxFrame = 200.0
  
  let minFont = 3.0
  let maxFont = 24.0
  
  let maxPVAngle: Double = 120 // Max Pitch view angle (delta Tangag)
  let maxBVAngle: Double = 120 // Max Bearing view angle (delta Azimuth)
  
  let isNearest: Bool
  
  let screenHeight = UIScreen.main.bounds.height
  
  var body: some View {
    ZStack {
      if (showCoinPoint()) {
        VStack(spacing: 0) {
          Text("\(coinPointM.title)")
            .font(Font.appFont(size: calcFontSize()))
            .fontWeight(.bold)
            .foregroundColor(.white)
          
//          Text("\(deltaHeightOffset.asAmountString)")
//            .font(Font.appFont(size: calcFontSize()))
//          Text("El: \(coinPointM.elevation.asAmountString) m.")
//              .font(Font.appFont(size: calcFontSize()))
//          Text("Distance: \(calcDistance().asAmountString)")
//            .font(Font.appFont(size: calcFontSize()))
          
          getCoinView(coinType: coinPointM.coinType)
            .frame(width: calcSize(), height: calcSize())
        }
        .animation(.default, value: locationManager.magneticHeading)
        .animation(.default, value: motionManager.gravityZ)
        .offset(x: calcXOffset(), y: calcYOffset())
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
        .opacity(isNearest ? 1 : rate())
    }
  }
  
  private var deltaHeightOffset: Double {
    let delta = (2 * calcDistance() * tan((maxPVAngle/2).degToRad) * (locationManager.altitude -  coinPointM.height - coinPointM.alt)) / screenHeight
    
    return delta
  }
  
  private func calcFontSize() -> CGFloat {
    let fontSize = maxFont * rate()
    
    return CGFloat(fontSize < minFont ? minFont : fontSize)
  }
  
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
    let distance = coinPointM.distance(from: locationManager.coordinate2D)
    
    return distance
  }
  
  private func calcBearing() -> Double {
    let bearing =  locationManager.coordinate2D.bearing(to: coinPointM.coordinate2D)
    
    return bearing
  }
  
  private func calcDiff() -> Double {
    let diff = calcBearing() - locationManager.trueHeading
    
    return diff
  }
  
  private func showCoinPoint() -> Bool {
    let distance = calcDistance()
   // Need to set || instead && for showing Coin Anyway from 0...minDist
    return distance <= maxDist && (-60...60).contains(calcDiff())
  }
  
  private func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    let yOffset = ((screenHeight * gravityZ) + deltaHeightOffset).rounded(to: 1)
    
    return yOffset
  }
  
  private func calcXOffset() -> CGFloat {
    let distance = calcDistance()
    let xOffset = (UIScreen.main.bounds.width * sin(calcDiff().degToRad)).rounded(to: 1)
    
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
