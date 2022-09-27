//
//  MotionManager.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

// https://trailingclosure.com/device-motion-effect/

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    @Published var pitch: Double = 0.0
    @Published var roll: Double = 0.0
    @Published var yaw: Double = 0.0
  
  @Published var gravityX: Double = 0.0
  @Published var gravityY: Double = 0.0
  @Published var gravityZ: Double = 0.0

    private var motionManager: CMMotionManager

    init() {
        self.motionManager = CMMotionManager()
        self.motionManager.deviceMotionUpdateInterval = 1/60
        self.motionManager.startDeviceMotionUpdates(to: .main) { (motionData, error) in
            guard error == nil else {
                print(error!)
                return
            }

            if let motionData = motionData {
                self.pitch = motionData.attitude.pitch
                self.roll = motionData.attitude.roll
                self.yaw = motionData.attitude.yaw
              
                self.gravityX = motionData.gravity.x
                self.gravityY = motionData.gravity.y
                self.gravityZ = motionData.gravity.z
            }
        }

    }
}
