//
//  SignInWithEmailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/12/22.
//

import SwiftUI

struct SignInWithEmailView: View {
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
      
      Text("Sign In")
        .font(Font.App.plain)
      
      TextField("Email", text: $email)
        .textInputAutocapitalization(.never)
        .keyboardType(.emailAddress)
        .textFieldStyle(CapsuleFieldStyle())
        .focused($focusedField, equals: .email)
      
      EyeSecureField(l: "Password", text: $password)
        .textInputAutocapitalization(.never)
        .focused($focusedField, equals: .password)
      
      Button(action: {
        hideKeyboard()
        print("Sign In Pressed!")
        self.store.dispatch(AuthAction.signInWithEmail(email: email, password: password))
        self.store.dispatch(PageAction.goTo(.home))
      }){
        Text("Sign In")
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

struct SignInWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SignInWithEmailView()
    }
  }
}
