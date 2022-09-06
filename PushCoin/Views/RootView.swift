//
//  RootView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/6/22.
//

import SwiftUI

struct RootView: View {
  
  var body: some View {
    MainView()
  }
}

struct RootView_Previews: PreviewProvider {
  static var previews: some View {
    let store: AppStore = Store(
      initialState: AppState(
        counterState: .initialState
      ),
      rootReducer: RootReducer(
        counterReducer: .init()
      )
    )
    
    RootView()
      .environmentObject(store)
  }
}
