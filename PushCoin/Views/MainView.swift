//
//  MainView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/3/22.
//

import SwiftUI

struct MainView: View {
  @StateObject var viewRouter = ViewRouter()
  
  var body: some View {
    VStack {
      Spacer()
      switch viewRouter.currentPage {
        case .home:
          Text("Home")
        case .wallet:
          Text("Wallet")
        case .mapPin:
          Text("Map Pin")
        case .burger:
          Text("Burger")
      }
      Spacer()
      HoleTapBarView(viewRouter: viewRouter)
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
