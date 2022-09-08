//
//  Colors.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

extension Color {
  enum App {
    static let shape = Color(0xD9D9D9)
  }
  
  enum Button {
    static let facebook = Color(0x4078FF)
    static let google = Color(0xDB4A39)
    static let apple = Color(0x000000)
  }
}

extension Gradient {
  static let tapBar = Gradient(colors: [Color(0x2F5B83), Color(0x0C0E23)])
  static let circleButton = Gradient(colors: [Color(0xFF8778), Color(0xFF5576)])
}
