//
//  CamPageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI

struct CamPageView: View {
  var body: some View {
    ZStack {
      CameraVisionView()
        .ignoresSafeArea(.all, edges: .all)
      PointsVisionView()
        .ignoresSafeArea(.all, edges: .all)
    }
  }
}

struct CamPageView_Previews: PreviewProvider {
  static var previews: some View {
    CamPageView()
  }
}
