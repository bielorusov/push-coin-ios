//
//  CounterState.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/4/22.
//

import Foundation

struct CounterState: ReduxState {
  static var initialState: CounterState {
    .init(count: 0)
  }
  
  let count: Int
}
