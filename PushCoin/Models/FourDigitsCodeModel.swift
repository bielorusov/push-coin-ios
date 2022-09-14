//
//  FourDigitsCodeModel.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/12/22.
//

import Foundation

struct FourDigitsCodeModel {
  var first: String = ""
  var second: String = ""
  var third: String = ""
  var fourth: String = ""
  
  var fullCode: String {
    "\(first)\(second)\(third)\(fourth)"
  }
  
//  func fullCode() -> String {
//    return "\(first)\(second)\(third)\(fourth)"
//  }
}
