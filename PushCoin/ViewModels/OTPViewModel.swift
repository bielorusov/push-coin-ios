//
//  OTPViewModel.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/13/22.
//

import SwiftUI

class OTPViewModel: ObservableObject {
  @Published var otpText: String = ""
  @Published var otpFields: [String] = Array(repeating: "", count: 4)
}

