//
//  AuthState.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/15/22.
//

import Foundation

struct AuthState: ReduxState {
  static var initialState: AuthState {
    .init(isLoggedIn: false)
  }
  
  let isLoggedIn: Bool
  
  //  TODO: Implement Session, User models objects
}
