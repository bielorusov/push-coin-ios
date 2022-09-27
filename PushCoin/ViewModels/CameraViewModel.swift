//
//  CameraViewModel.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/22/22.
//

import SwiftUI
import AVFoundation

// Camera model ...
class CameraViewModel: ObservableObject {
  @Published var isTaken = false
  @Published var session = AVCaptureSession()
  @Published var alert = false
  
  // Since were going to read pic data...
  @Published var output = AVCapturePhotoOutput()
  
  //  Preview
  @Published var preview: AVCaptureVideoPreviewLayer!
  
  func checkPermissions(){
    // Checking Camera permission
    switch AVCaptureDevice.authorizationStatus(for: .video) {
      case .authorized:
        // SettingsUp session
        setUp()
        return
      case .notDetermined:
        //Requesting access
        AVCaptureDevice.requestAccess(for: .video){ (status) in
          if status {
            self.setUp()
          }
        }
      case .denied:
        self.alert.toggle()
        return
      default:
        return
    }
  }
  
  func setUp(){
    // Settings Up Camera
    self.session.beginConfiguration()
    // Change for your Own
    let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .unspecified) // .back
    
    guard let input = try? AVCaptureDeviceInput(device: device!), self.session.canAddInput(input) else { return }
    self.session.addInput(input)
    
    guard self.session.canAddOutput(output) else { return }
    self.session.sessionPreset = .photo
    self.session.addOutput(output)
    
    self.session.commitConfiguration()
  }
}
