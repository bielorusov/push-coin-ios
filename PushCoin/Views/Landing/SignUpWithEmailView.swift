//
//  SignUpWithEmailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SignUpWithEmailView: View {
  @State private var password = ""
  @State private var email = ""
  var body: some View {
    VStack {
      Form {
        TextField("Email", text: $email)
        SecureTextField(l: "Password", text: $password)
      }
    }
  }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    SignUpWithEmailView()
  }
}
