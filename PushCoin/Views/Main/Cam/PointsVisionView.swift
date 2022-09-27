//
//  PointsVisionView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

import SwiftUI

struct PointsVisionView: View {
  @ObservedObject private var locationManager = LocationManager()
  @ObservedObject private var motionManager: MotionManager = MotionManager()
  
  var body: some View {
    if (showCoinPoint()) {
      CoinSequenceView(coinType: "coin")
        .frame(width: 200, height: 200)
        .offset(x: calcXOffset(), y: calcYOffset())
        .animation(.default, value: self.locationManager.magneticHeading)
        .animation(.default, value: self.motionManager.gravityZ)      
    }
  }
}

extension PointsVisionView {
  private func showCoinPoint() -> Bool {
    let radDirect = locationManager.magneticHeading.degToRad - .pi
    
    return ((-.pi/4)...(.pi/4)).contains(radDirect)
  }
  
  private func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ)
    
    return (screenHeight * gravityZ).rounded(to: 1)
  }
  
  private func calcXOffset() -> CGFloat {
    let direct = locationManager.magneticHeading
    
    return (((.pi * (UIScreen.main.bounds.width + 100))/2) * sin(direct.degToRad)).rounded(to: 1)
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
