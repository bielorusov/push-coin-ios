//
//  SignUpWithEmailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SignUpWithEmailView: View {
  @State private var email = ""
  @State private var password = ""
  
  // https://www.raywenderlich.com/31569019-focus-management-in-swiftui-getting-started
  enum FormFocusable: Hashable {
    case email
    case password
  }
  
  @FocusState private var focusedField: FormFocusable?
  
  var body: some View {
    VStack(spacing: 0) {
      TextField("Email", text: $email)
        .keyboardType(.emailAddress)
        .textFieldStyle(CapsuleFieldStyle())
        .focused($focusedField, equals: .email)
      
      EyeSecureField(l: "Password", text: $password)
        .focused($focusedField, equals: .password)
      
      Text("Пароль длжен содержать буквы и цифры, и иметь длину не менее 6 символов.")
        .font(.subheadline)
      
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        self.focusedField = .email
      }
    }
  }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpWithEmailView()
  }
}
