//
//  CameraVisionView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

import SwiftUI

struct CameraVisionView: View {
  @StateObject var cameraVM = CameraViewModel()
  
  var body: some View {
    CameraView(cameraVM: cameraVM)
      .onAppear(perform: {
        cameraVM.checkPermissions()
      })
  }
}

struct CameraVisionView_Previews: PreviewProvider {
  static var previews: some View {
    CameraVisionView()
  }
}
