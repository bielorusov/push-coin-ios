//
//  ContentView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI

struct ContentView: View {
  private let store = Core.initedStore
  
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
