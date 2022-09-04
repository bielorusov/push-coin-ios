//
//  RootReducer.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/4/22.
//

import Foundation

struct RootReducer: ReduxReducer {
  let counterReducer: CounterReducer
  
  func reduce(state: AppState?, action: ReduxAction?) -> AppState {
    return AppState(
      counterState: counterReducer.reduce(
        state: state?.counterState,
        action: action
      )
    )
  }
}
