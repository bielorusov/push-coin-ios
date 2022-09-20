//
//  HomePageView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/19/22.
//

import SwiftUI

struct HomePageView: View {
  var body: some View {
    ZStack {
      Color.App.bg.ignoresSafeArea()
      HomeContentView()
      HomeSectionsView()
    }
  }
}

struct HomePageView_Previews: PreviewProvider {
  static var previews: some View {
    HomePageView()
  }
}
