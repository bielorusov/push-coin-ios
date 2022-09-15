//
//  LandingView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/3/22.
//

import SwiftUI

struct LandingView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    switch store.state.pageState.currentPage {
      case .signInWithEmail:
        SignInWithEmailView()
      case .signUpWithEmail:
        SignUpWithEmailView()
      case .otpVerification:
        OTPVerificationView()
      default: SignUpView()
    }
  }
}

struct LandingView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      LandingView()
    }
  }
}
