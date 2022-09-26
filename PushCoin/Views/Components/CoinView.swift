//
//  CoinView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

struct CoinView: View {
  private let images = (1...30).map { String("coin_\($0)") }.map { Image($0) }
  
  var body: some View {
    ImageSequenceView(images: images)
  }
}

struct CoinView_Previews: PreviewProvider {
  static var previews: some View {
    CoinView()
  }
}
