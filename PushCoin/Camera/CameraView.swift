//
//  CamView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/22/22.
//

//https://www.youtube.com/watch?v=cLnw5z8ZGqM
//https://github.com/daved01/LiveCameraSwiftUI/tree/main/LiveCameraSwiftUI
//https://www.youtube.com/watch?v=8hvaniprctk
//https://www.youtube.com/watch?v=Y-65T0YBOm4
//https://www.youtube.com/watch?v=W60nnRFUGaI
//https://www.youtube.com/watch?v=ZYPNXLABf3c
//https://www.neuralception.com/detection-app-tutorial-detector/
//https://www.hackingwithswift.com/books/ios-swiftui/scanning-qr-codes-with-swiftui

import SwiftUI
import AVFoundation

// Settings view for preview...
struct CameraView: UIViewRepresentable {
  @ObservedObject var cameraVM: CameraViewModel
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: UIScreen.main.bounds)
    
    cameraVM.preview = AVCaptureVideoPreviewLayer(session: cameraVM.session)
    cameraVM.preview.frame = view.frame
    
    // Your Own properties
    cameraVM.preview.videoGravity = .resizeAspectFill
    view.layer.addSublayer(cameraVM.preview)
    
    // Starting session...
    cameraVM.session.startRunning()
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
  }
}
