//
//  CamPageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI
import AVFoundation
//https://www.youtube.com/watch?v=cLnw5z8ZGqM
//https://github.com/daved01/LiveCameraSwiftUI/tree/main/LiveCameraSwiftUI

//https://www.youtube.com/watch?v=8hvaniprctk
//https://www.youtube.com/watch?v=Y-65T0YBOm4
//https://www.youtube.com/watch?v=W60nnRFUGaI
//https://www.youtube.com/watch?v=ZYPNXLABf3c
//https://www.neuralception.com/detection-app-tutorial-detector/
//https://www.hackingwithswift.com/books/ios-swiftui/scanning-qr-codes-with-swiftui

struct CamPageView: View {
  @StateObject var camera = CameraModel()
  
  var body: some View {
    ZStack{
      CameraPreview(camera: camera)
        .ignoresSafeArea(.all, edges: .all)
    }
    .onAppear(perform: {
      camera.Check()
    })
  }
}

// Camera model ...
class CameraModel: ObservableObject {
  @Published var isTaken = false
  @Published var session = AVCaptureSession()
  @Published var alert = false
  
  // Since were going to read pic data...
  @Published var output = AVCapturePhotoOutput()
  
  //  Preview
  @Published var preview: AVCaptureVideoPreviewLayer!
  
  func Check(){
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
    
    guard
      let input = try? AVCaptureDeviceInput(device: device!),
      self.session.canAddInput(input)
    else { return }
    self.session.addInput(input)
    
    guard self.session.canAddOutput(output) else { return }
    self.session.sessionPreset = .photo
    self.session.addOutput(output)
    
    self.session.commitConfiguration()
  }
}

// Settings view for preview...
struct CameraPreview: UIViewRepresentable {
  @ObservedObject var camera: CameraModel
  
  func makeUIView(context: Context) -> UIView {
    let view = UIView(frame: UIScreen.main.bounds)
    
    camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
    camera.preview.frame = view.frame
    
    // Your Own properties
    camera.preview.videoGravity = .resizeAspectFill
    view.layer.addSublayer(camera.preview)
    
    // Starting session...
    camera.session.startRunning()
    
    return view
  }
  
  func updateUIView(_ uiView: UIView, context: Context) {
  }
}



struct CamPageView_Previews: PreviewProvider {
  static var previews: some View {
    CamPageView()
  }
}
