//
//  CoinSequenceView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

struct ImageSequenceView: View {
  let images: [Image]
  @ObservedObject private var counter = SequenceCounter(interval: 0.05)
  
  var body: some View {
    images[counter.value % images.count]
      .resizable()
  }
  
  private class SequenceCounter: ObservableObject {
    private var timer: Timer?
    
    @Published var value: Int = 0
    
    init(interval: Double) {
      timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in self.value += 1 }
    }
  }
}


