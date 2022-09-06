//
//  PushCoinApp.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI
typealias AppStore = Store<AppState, RootReducer>

@main
struct PushCoinApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
    }
  }
}
