//
//  CamPageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI
import AVFoundation

struct CamPageView: View {
  @StateObject var cameraVM = CameraViewModel()
  @ObservedObject private var locationManager = LocationManager()
  @ObservedObject private var motionManager: MotionManager = MotionManager()
  
  var body: some View {
    
    ZStack{
      CameraView(cameraVM: cameraVM)
        .ignoresSafeArea(.all, edges: .all)
      if (showCoinPoint()) {
        CoinView()
            .frame(width: 100, height: 100)
            .offset(x: calcXOffset(), y: calcYOffset())
      }
      
//      Text("x: \(motionManager.roll.rounded(to: 2)) y: \(motionManager.pitch.rounded(to: 2)) z: \(motionManager.yaw.rounded(to: 2))")
      
//      Text("x: \(motionManager.gravityX.rounded(to: 2)) y: \(motionManager.gravityY.rounded(to: 2)) z: \(motionManager.gravityZ.rounded(to: 2))")
//        .offset(y: 60)
      
//      Text("\(calcXOffset()) => \(showCoinPoint() ? "TRUE" : "FALSE")")
//      Text("\(locationManager.magneticHeading.degToRad)")
//        .offset(y: 60)
      
//      Text("\(locationManager.magneticHeading.rounded() - 180)")
    }
    .onAppear(perform: {
      cameraVM.checkPermissions()
    })
  }
  
  func showCoinPoint() -> Bool {
    let radDirect = locationManager.magneticHeading.degToRad - .pi
    return ((-.pi/4)...(.pi/4)).contains(radDirect)
//    let radDirect = locationManager.magneticHeading.rounded()
//    return (40...320).contains(radDirect)
//    return true
  }
  
  func calcYOffset() -> CGFloat {
    let screenHeight = UIScreen.main.bounds.height
    let gravityZ = CGFloat(motionManager.gravityZ.rounded(to: 2))
    
    return screenHeight * gravityZ
  }
  
  func calcXOffset() -> CGFloat {
    let direct = locationManager.magneticHeading
    
    return (((.pi * UIScreen.main.bounds.width)/2) * sin(direct.degToRad))
  }
}

struct CamPageView_Previews: PreviewProvider {
  static var previews: some View {
    CamPageView()
  }
}
