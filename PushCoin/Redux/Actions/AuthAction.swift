//
//  AuthAction.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/15/22.
//

import Foundation


enum AuthAction: ReduxAction {
  case signUpWithEmail(email: String, password: String)
  case confirmEmailOTP(email: String, otpCode: String)
  case signInWithEmail(email: String, password: String)
  case signInWithFacebook
  case signInWithGoogle
  case signInWithApple
  case signOut
}
