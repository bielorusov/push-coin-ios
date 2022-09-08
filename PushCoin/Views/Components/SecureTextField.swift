//
//  SecureTextFieldView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SecureTextField: View {
  let l: String
  @State private var isSecured: Bool = true
  @Binding var text: String
  
  var body: some View {
    HStack{
      if isSecured {
        SecureField(l, text: $text)
      } else {
        TextField(text, text: $text)
      }
    }.overlay(alignment: .trailing) {
      Image(systemName: isSecured ? "eye.slash" : "eye")
        .onTapGesture {
          isSecured.toggle()
        }
    }
  }
}
