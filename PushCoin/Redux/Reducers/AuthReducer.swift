//
//  AuthReducer.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/15/22.
//

import Foundation

struct AuthReducer: ReduxReducer {
  func reduce(state: AuthState?, action: ReduxAction?) -> AuthState {
    let currentState = state ?? AuthState.initialState
    
    guard let action = action as? AuthAction else {
      return currentState
    }
    
    switch action {
      case .signUpWithEmail(let email, let password):
        return signUpWithEmail(for: currentState, email: email, password: password)
      case .confirmEmailOTP(let email, let otpCode):
        return confirmEmailOTP(for: currentState, email: email, otpCode: otpCode)
      case .signInWithEmail(let email, let password):
        return signInWithEmail(for: currentState, email: email, password: password)
      case .signInWithFacebook:
        return signInWithFacebook(for: currentState)
      case .signInWithGoogle:
        return signInWithGoogle(for: currentState)
      case .signInWithApple:
        return signInWithApple(for: currentState)
      case .signOut:
        return signOut(for: currentState)
    }
  }
  
  private func signUpWithEmail(for state: AuthState, email: String, password: String) -> AuthState {
    print("EMAIL: \(email), PSW: \(password)")
    return AuthState(isLoggedIn: true)
  }
  
  private func confirmEmailOTP(for state: AuthState, email: String, otpCode: String) -> AuthState {
    print("EMAIL: \(email), OTP: \(otpCode)")
    return  AuthState(isLoggedIn: true)
  }
  
  private func signInWithEmail(for state: AuthState, email: String, password: String) -> AuthState {
    print("EMAIL: \(email), PSW: \(password)")
    return AuthState(isLoggedIn: true)
  }
  
  private func signInWithFacebook(for state: AuthState) -> AuthState {
    AuthState(isLoggedIn: true)
  }
  
  private func signInWithGoogle(for state: AuthState) -> AuthState {
    AuthState(isLoggedIn: true)
  }
  
  private func signInWithApple(for state: AuthState) -> AuthState {
    AuthState(isLoggedIn: true)
  }
  
  private func signOut(for state: AuthState) -> AuthState {
    AuthState(isLoggedIn: false)
  }
}
