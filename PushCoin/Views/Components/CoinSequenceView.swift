//
//  CoinView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

struct CoinSequenceView: View {
  let coinType: String
  
  private var images: [Image]
  
  init(coinType: String) {
    self.coinType = coinType // coin, silver, bronze
    self.images = (0...60).map {
      String(format: "\(coinType)_%05d", $0)
    }.map { Image($0) }
  }
  
  var body: some View {
    ImageSequenceView(images: images, interval: 0.05)
  }
}

struct CoinSequenceView_Previews: PreviewProvider {
  static var previews: some View {
    CoinSequenceView(coinType: "coin")
      .frame(width: 160, height: 160)
  }
}
