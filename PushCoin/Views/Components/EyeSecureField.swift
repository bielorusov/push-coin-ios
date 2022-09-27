//
//  SecureTextFieldView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct EyeSecureField: View {
  let l: String
  @State private var isSecured: Bool = true
  @Binding var text: String
  
  var body: some View {
    HStack(spacing: 0){
      if isSecured {
        SecureField(l, text: $text)
          .textFieldStyle(CapsuleFieldStyle())
      } else {
        TextField(l, text: $text)
          .textFieldStyle(CapsuleFieldStyle())
      }
    }.overlay(alignment: .trailing) {
      Image(systemName: isSecured ? "eye.slash" : "eye")
        .onTapGesture {
          isSecured.toggle()
        }.offset(x: -Geometry.Size.padding, y: 0)
    }
  }
}


struct EyeSecureFieldView_Previews: PreviewProvider {
  static var previews: some View {
    EyeSecureField(l: "Some Text", text: .constant("Some Text"))
  }
}
