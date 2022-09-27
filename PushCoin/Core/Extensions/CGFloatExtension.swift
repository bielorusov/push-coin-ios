//
//  CGFloatExtension.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

extension CGFloat {
  var degToRad: CGFloat { return self * .pi / 180 }
  var radToDeg: CGFloat { return self * 180 / .pi }
  
  func rounded(to places: Int) -> CGFloat {
    return CGFloat(Double(self).rounded(to: places))
  }
}

