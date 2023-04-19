//
//  CoinPointView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/28/22.
//

import SwiftUI

struct CoinPointView: View {
  let coinPointM: CoinPointModel
  let motionManager: MotionManager
  let locationManager: LocationManager
  
  let minDist: Double
  @Binding var maxDist: Double
  let isNearest: Bool
  let screenHeight = UIScreen.main.bounds.height
  let screenWidth = UIScreen.main.bounds.width
  
  let minFrame = 30.0
  let maxFrame = 130.0
  let minFont = 10.0
  let maxFont = 15.0
  
  var body: some View {
    ZStack {
      if (isVisible) {
        VStack(spacing: 0) {
          Text("\(coinPointM.title)")
            .font(Font.appFont(size: fontSize))
            .fontWeight(.bold)
            .foregroundColor(.white)
          ZStack {
            getCoinView(coinType: coinPointM.coinType)
              .frame(width: frameSize, height: frameSize)
            
            VStack {
              Text("\(distance2D.asAmountString)")
                .font(Font.appFont(size: fontSize))
                .foregroundColor(.black)
              Text("\(deltaH.asAmountString)")
                .font(Font.appFont(size: fontSize))
                .foregroundColor(.black)
            }
          }
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
      // Sequented coin
      CoinSequenceView(coinType: coinType, interval: 0.05)
    } else {
      // Static coin with opacity by rate
      Image(String(format: "\(coinType)_%05d", 10))
        .resizable()
//        .opacity(isNearest ? 1 : distRate2D)
    }
  }
  
  private var fontSize: CGFloat {
    return maxFont * distRate2D
  }
  
  private var frameSize: Double {
    return maxFrame * distRate2D
  }
  
  private var distRate2D: Double {
    switch distance2D {
      case 0..<minDist:
        return 1
      case minDist...maxDist:
        return 1 - distance2D/maxDist
      default:
        return 0
    }
  }
  
  private var distanceP2P: Double {
    sqrt(pow(distance2D, 2) + pow(deltaH, 2))
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
    return (0...maxDist).contains(distance2D) && (-60...60).contains(bearingDiff)
  }
  
  private var deltaH: Double {
//    coinPointM.fullHeight - locationManager.altitude
      coinPointM.height + locationManager.altitude
  }
  
  private var gravityZ: Double {
    motionManager.gravityZ
  }
  
  // Return from Down to Up (-.pi/2 ... .pi/2)
  private var gravityZInRad: Double {
    asin(gravityZ)
  }
  
  // Angle between horizont and vector to Point
  private var pointPitchInRad: Double {
    gravityZInRad - atan(deltaH/distance2D)
  }
  
  private var yOffset: CGFloat {
//    return screenHeight * tan(pointPitchInRad) //* distRate2D
      return 0.0
  }
  
  private var xOffset: CGFloat {
    return distance2D < minDist ? 0.0 : (screenWidth * sin(bearingDiff.degToRad))
  }
}

struct CoinPointViewView_Previews: PreviewProvider {
  static var previews: some View {
    CoinPointView(
      coinPointM: CoinPointModel.points[0],
      motionManager: MotionManager(),
      locationManager: LocationManager(),
      minDist: 3,
      maxDist: .constant(50),
      isNearest: true
    )
  }
}
