//
//  CoinSequenceView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/26/22.
//

import SwiftUI

struct ImageSequenceView: View {
  let images: [Image]
  let interval: Double
  
  @ObservedObject private var counter: SequenceCounter
  
  init(images: [Image], interval: Double) {
    self.images = images
    self.interval = interval
    self.counter = SequenceCounter(interval: interval)
  }
  
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


