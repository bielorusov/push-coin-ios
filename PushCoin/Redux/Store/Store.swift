//
//  Store.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/4/22.
//

import Foundation

open class Store<AppState, RootReducer>: ReduxStore
where RootReducer: ReduxReducer,
      RootReducer.S == AppState
{
  @Published
  private(set) public var state: AppState
  
  private let rootReducer: RootReducer
  
  init(
    initialState: S,
    rootReducer: RootReducer
  ) {
    self.state = initialState
    self.rootReducer = rootReducer
  }
  
  public func dispatch(_ action: ReduxAction) {
    state = rootReducer.reduce(
      state: state,
      action: action
    )
  }
}

public protocol ReduxStore: ObservableObject {
  associatedtype S: ReduxState
  
  var state: S { get }
  
  func dispatch(_ action: ReduxAction)
}
