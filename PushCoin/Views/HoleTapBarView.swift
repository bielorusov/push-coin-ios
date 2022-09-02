//
//  HoleTapBarView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI

struct HoleTapBarView: View {
    var body: some View {
      VStack{
        Spacer()
        HoleShape()
      }
      .edgesIgnoringSafeArea(.all)
    }
}

struct HoleShape: View {
  let gradient = Gradient(colors: [Color("HoleTapBar_1"), Color("HoleTapBar_0")])
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(RadialGradient(gradient: gradient, center: .top, startRadius: -0, endRadius: 120))
        .frame(width: UIScreen.main.bounds.width, height: 60)
      Image("HoleMask")
        .frame(width: UIScreen.main.bounds.width, height: 60)
        .offset(x: 0, y: -12)
        .blendMode(.destinationOut)
    }
    .compositingGroup()
  }
}

struct HoleTapBarView_Previews: PreviewProvider {
    static var previews: some View {
        HoleTapBarView()
    }
}
