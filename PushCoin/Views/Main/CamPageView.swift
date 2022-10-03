//
//  CamPageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/21/22.
//

import SwiftUI

struct CamPageView: View {
//  @ObservedObject private var point = CoinPointModel.dashkaPoints[0]
  
  var body: some View {
    ZStack {
      CameraVisionView()
        .ignoresSafeArea(.all, edges: .all)
      PointsVisionView()
        .ignoresSafeArea(.all, edges: .all)
//      Text("Addr: \(point.address)")
//        .onAppear(perform: {
//          point.asyncGetAddress()
//        })
    }
  }
}

struct CamPageView_Previews: PreviewProvider {
  static var previews: some View {
    CamPageView()
  }
}
