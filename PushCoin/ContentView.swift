//
//  ContentView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI

struct ContentView: View {
  private let store: AppStore = Store(
    initialState: AppState(
      counterState: .initialState,
      pageState: .initialState
    ),
    rootReducer: RootReducer(
      counterReducer: .init(),
      pageReducer: .init()
    )
  )
  
  var body: some View {
    VStack {
      RootView()
        .environmentObject(store)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
