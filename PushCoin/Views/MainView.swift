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
    VStack {
      Spacer()
      switch store.state.pageState.currentPage {
        case .home:
          CounterView()
        case .wallet:
          Text("Wallet")
        case .mapPin:
          Text("Map Pin")
        case .burger:
          Button(action: {
            self.store.dispatch(AuthAction.signOut)
          }) {
            Text("Log Out")
          }
        default: Text("Default Page")
      }
      Spacer()
      HoleTapBarView()
    }
    .edgesIgnoringSafeArea(.all)
  }
}

struct CounterView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    VStack {
      Text("\(store.state.counterState.count)")
        .padding()
      HStack {
        Button("Increase") {
          self.store.dispatch(CounterAction.increase)
        }
        
        Button("Decrease") {
          self.store.dispatch(CounterAction.decrease)
        }
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
      .environmentObject(Core.initedStore)
  }
}

