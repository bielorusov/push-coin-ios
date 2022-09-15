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
      .frame(
        width: Geometry.Size.inputFieldWidth,
        height: Geometry.Size.inputFieldHeight
      )
  }
}

extension Text {
  func subheadlineStyle() -> some View {
    self.opacity(0.5)
        .font(Font.App.subheadline)
//        .frame(width: Geometry.Size.inputFieldWidth)
//        .padding(.top, Geometry.Size.padding)
  }
  
  func capsuleButtonPrimaryStyle() -> some View {
    Capsule()
      .fill(Color.Button.blue)
      .frame(
        width: Geometry.Size.buttonWidth,
        height: Geometry.Size.buttonHeight
      ).overlay {
        self
          .font(Font.App.buttonText)
          .foregroundColor(Color.Button.text)
      }
  }
}
