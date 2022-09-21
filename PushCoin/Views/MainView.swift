//
//  MainView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/3/22.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    ZStack {      
      VStack(spacing: 0) {
        switch store.state.pageState.currentPage {
          case .home:
            HomePageView()              
          case .wallet:
            Text("Wallet")
          case .mapPage:
            MapPageView()
          case  .camPage:
            CamPageView()
          case .burger:
            Button(action: {
              self.store.dispatch(AuthAction.signOut)
            }) {
              Text("Log Out")
            }
          default: Text("Default Page")
        }
      }
      
      VStack {
        Spacer()
        HoleTapBarView()
      }
      .edgesIgnoringSafeArea(.all)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(Core.initedStore)
  }
}

