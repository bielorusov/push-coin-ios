//
//  DecimalExtension.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/27/22.
//

import Foundation

extension Double {
//  var round2: Double { return (round(self * 100) / 100) }
  
  func rounded(to places: Int) -> Double {
    let divisor = pow(10.0, Double(places))
    
    return (self * divisor).rounded() / divisor
  }
}
