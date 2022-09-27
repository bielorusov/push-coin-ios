//
//  Shapes.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/22/22.
//

import SwiftUI

// https://www.hackingwithswift.com/books/ios-swiftui/paths-vs-shapes-in-swiftui
struct ArcShape: Shape {
  let startAngle: Angle
  let endAngle: Angle
  let clockWise: Bool
  
  func path(in rect: CGRect) -> Path {
    var path = Path()
    path.addArc(
      center: CGPoint(x: rect.midX, y: rect.midY),
      radius: rect.width / 2,
      startAngle: startAngle,
      endAngle: endAngle,
      clockwise: clockWise
    )
    
    return path
  }
}
