//
//  Redux.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/6/22.
//

import Foundation

public protocol ReduxAction {}

public protocol ReduxState {}

public protocol ReduxReducer {
  associatedtype S: ReduxState
  
  func reduce(state: S?, action: ReduxAction?) -> S
}
