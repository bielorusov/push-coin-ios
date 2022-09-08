//
//  Core.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import Foundation

class Core {
  static let initedStore: AppStore = Store(
    initialState: AppState(counterState: .initialState, pageState: .initialState),
    rootReducer: RootReducer(counterReducer: .init(), pageReducer: .init())
  )
}
