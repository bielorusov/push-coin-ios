//
//  RootView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/6/22.
//

import SwiftUI

struct RootView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    if store.state.authState.isLoggedIn {
      MainView()
    } else {
      LandingView()
    }
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    RootView()
      .environmentObject(Core.initedStore)
  }
}
