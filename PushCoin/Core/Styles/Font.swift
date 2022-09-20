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
    static let title = appFont(size: 24).weight(.bold)
    static let body = appFont(size: 20)
    
    static let plain = appFont(size: 16).weight(.semibold)
    static let input = appFont(size: 16)
    static let inputMedium = appFont(size: 20)
    static let headMedium = appFont(size: 18)
    static let largeMedium = appFont(size: 48).weight(.bold)
    static let buttonText = appFont(size: 16).weight(.bold)
    static let subheadline = appFont(size: 12)
    
//    static let appTitle = appFont(size: 32).weight(.semibold)
//    static let appSubtitle = appFont(size: 20).weight(.medium)
//    static let appCaption = appFont(size: 14).weight(.regular)
  }
}
 
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Text("SwiftUI")
//                .font(.appTitle)
//            Text("It is awesome!")
//                .font(.appCaption)
//        }
//    }
//}
