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
          CounterView()
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
    let store: AppStore = Store(
      initialState: AppState(
        counterState: .initialState
      ),
      rootReducer: RootReducer(
        counterReducer: .init()
      )
    )
    
    MainView()
      .environmentObject(store)
  }
}

