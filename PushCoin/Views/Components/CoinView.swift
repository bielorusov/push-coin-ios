//
//  CoinView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

struct CoinView: View {
  private let images = (0...60).map { String(format: "coin_%05d", $0) }.map { Image($0) }
  
  var body: some View {
    ImageSequenceView(images: images)
  }
}

struct CoinView_Previews: PreviewProvider {
  static var previews: some View {
    CoinView()
      .frame(width: 160, height: 160)
  }
}
