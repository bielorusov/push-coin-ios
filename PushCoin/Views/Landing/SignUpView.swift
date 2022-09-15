//
//  SignUpView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SignUpView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    VStack(spacing: Geometry.Size.padding) {
      Circle()
        .fill(Color.App.shape)
        .frame(width: 166, height: 166)
        .padding(.top, 2 * Geometry.Size.padding)

      Spacer()
      
      Text("Sign up with")
        .font(Font.App.plain)
      
      SocialPlateView()
      
      LabelledDivider(label: "or")
        .frame(width: Geometry.Size.formWidth)
      
      Button(action: {
        print("Sign Up With Email Pressed!")
        self.store.dispatch(PageAction.goTo(.signUpWithEmail))
      }){
        Text("I’ll use email or phone")
          .capsuleButtonPrimaryStyle()
      }
      
      HStack {
        Text("Already have an account?")
          .font(Font.App.plain)
        Button(action: {
          print("Sign In link pressed")
          self.store.dispatch(PageAction.goTo(.signInWithEmail))
        }) {
          Text("Sign in")
            .font(Font.App.plain)
        }
      }
    }
    .padding(.bottom, Geometry.Size.doublePadding)
  }
}

struct SignUpView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpView()
  }
}
