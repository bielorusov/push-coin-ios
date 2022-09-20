//
//  ViewExtension.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

extension View {
  // view.inverseMask(_:)
  public func inverseMask<M: View>(_ mask: M) -> some View {
    // exchange foreground and background
    let inversed = mask
      .foregroundColor(.black)  // hide foreground
      .background(Color.white)  // let the background stand out
      .compositingGroup()       // ⭐️ composite all layers
      .luminanceToAlpha()       // ⭐️ turn luminance into alpha (opacity)
    return self.mask(inversed)
  }
}
