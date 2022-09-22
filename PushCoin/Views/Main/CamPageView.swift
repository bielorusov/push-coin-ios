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
  
  var body: some View {
    ZStack{
      CameraView(cameraVM: cameraVM)
        .ignoresSafeArea(.all, edges: .all)
    }
    .onAppear(perform: {
      cameraVM.checkPermissions()
    })
  }
}

struct CamPageView_Previews: PreviewProvider {
  static var previews: some View {
    CamPageView()
  }
}
