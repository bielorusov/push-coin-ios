//
//  CapsuleFieldStyle.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct CapsuleFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .font(Font.App.input)
      .padding(Geometry.Size.padding)
      .background(Color.Form.input)
      .clipShape(Capsule())
      .frame(width: 335, height: 56)
  }
}

