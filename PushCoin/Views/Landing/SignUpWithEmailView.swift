//
//  SignUpWithEmailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SignUpWithEmailView: View {
  @EnvironmentObject var store: AppStore
  
  @State private var email = ""
  @State private var password = ""
  
  enum FormFocusable: Hashable {
    case email
    case password
  }
  
  @FocusState private var focusedField: FormFocusable?
  
  var body: some View {
    VStack(spacing: Geometry.Size.padding) {
      Spacer()
      
      Text("Sign up with Email")
        .font(Font.App.plain)
      
      TextField("Email", text: $email)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .textFieldStyle(CapsuleFieldStyle())
        .focused($focusedField, equals: .email)
      
      EyeSecureField(l: "Password", text: $password)
        .textInputAutocapitalization(.never)
        .focused($focusedField, equals: .password)
      
      Text("The password must contain letters and numbers and be at least 6 characters long.")
        .opacity(0.5)
        .font(Font.App.subheadline)
        .frame(maxWidth: Geometry.Size.formWidth)
        .fixedSize(horizontal: false, vertical: true)
      
      Button(action: {
        hideKeyboard()
        print("Sign UP Pressed!")
        // TODO: Should be resolved inside action
//        self.store.dispatch(AuthAction.signUpWithEmail(email: email, password: password))
        self.store.dispatch(PageAction.goTo(.otpVerification))
      }){
        Text("Sign Up")
          .capsuleButtonPrimaryStyle()
      }
      .disabled(!formCompleted())
      .opacity(formCompleted() ? 1 : 0.4)
      
      SocialPlateView(fullSize: false)
    }
    .padding(.bottom, Geometry.Size.doublePadding)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        focusedField = .email
      }
    }
  }
  
  func formCompleted() -> Bool {
    return !email.isEmpty && !password.isEmpty
  }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SignUpWithEmailView()
    }      
  }
}
