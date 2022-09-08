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
  
  enum FormFocusable: Hashable {
    case email
    case password
  }
  
  @FocusState private var focusedField: FormFocusable?
  
  var body: some View {
    VStack(spacing: 0) {
      Spacer()
      
      Text("Sign up with Email")
        .font(Font.App.plain)
        .padding([.top, .bottom], Geometry.Size.padding)
      
      TextField("Email", text: $email)
        .keyboardType(.emailAddress)
        .textFieldStyle(CapsuleFieldStyle())
        .focused($focusedField, equals: .email)
      
      EyeSecureField(l: "Password", text: $password)
        .padding(.top, Geometry.Size.padding)
        .focused($focusedField, equals: .password)
      
      Text("The password must contain letters and numbers and be at least 6 characters long.")
        .opacity(0.5)
        .font(Font.App.subheadline)
        .frame(width: 335)
        .padding(.top, Geometry.Size.padding)
      
      Button(action: {
        print("Sign UP Pressed!")
      }){
        Capsule()
          .fill(Color.Button.gray)
          .frame(
            width: Geometry.Size.buttonWidth,
            height: Geometry.Size.buttonHeight
          ).overlay {
            Text("I’ll use email or phone")
              .font(Font.App.buttonText)
              .foregroundColor(.black)
          }
      }.padding(.top, Geometry.Size.padding)
      
      SocialPlateView(fullSize: false)
        .padding(.top, Geometry.Size.padding)
      
    }
    .padding(.bottom, Geometry.Size.padding)
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        focusedField = .email
      }
    }
  }
}

struct SignUpWithEmailView_Previews: PreviewProvider {
  static var previews: some View {
    ZStack {
      SignUpWithEmailView()
    }      
  }
}
