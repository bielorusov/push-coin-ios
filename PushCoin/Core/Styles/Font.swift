//
//  Font.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

extension Font {
    static func appFont(size: CGFloat) -> Font {
        return Font.custom("Inter", size: size)
    }
    
  enum App {
    static let title = appFont(size: 20).weight(.bold)
    static let body = appFont(size: 16)
    
    static let plain = appFont(size: 16).weight(.semibold)
    static let input = appFont(size: 16)
    static let inputMedium = appFont(size: 20)
    static let headMedium = appFont(size: 18)
    static let largeMedium = appFont(size: 36).weight(.bold)
    static let buttonText = appFont(size: 16).weight(.bold)
    static let subheadline = appFont(size: 12)
  }
}
