//
//  SignInWithEmailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/12/22.
//

import SwiftUI

struct SignInWithEmailView: View {
  @State private var email = ""
  @State private var password = ""
  
  enum FormFocusable: Hashable {
    case email
    case password
  }
  
  @FocusState private var focusedField: FormFocusable?
  
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
      
      Text("Sign In")
        .font(Font.App.plain)
        .padding([.top, .bottom], Geometry.Size.padding)
      
      TextField("Email", text: $email)
        .keyboardType(.emailAddress)
        .textFieldStyle(CapsuleFieldStyle())
        .focused($focusedField, equals: .email)
      
      EyeSecureField(l: "Password", text: $password)
        .padding(.top, Geometry.Size.padding)
        .focused($focusedField, equals: .password)
      
      Button(action: {
        hideKeyboard()
        print("Sign In Pressed!")
      }){
        Text("Sign In")
          .capsuleButtonPrimaryStyle()
      }.padding(.top, Geometry.Size.padding)
      
      SocialPlateView(fullSize: false)
        .padding(.top, Geometry.Size.padding)
      
    }
    .padding(.bottom, Geometry.Size.doublePadding)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        focusedField = .email
      }
    }
  }
}

struct SignInWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SignInWithEmailView()
    }
  }
}
