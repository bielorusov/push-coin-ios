//
//  ReduxReducer.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/4/22.
//

import Foundation

public protocol ReduxReducer {
  associatedtype S: ReduxState
  
  func reduce(state: S?, action: ReduxAction?) -> S
}
