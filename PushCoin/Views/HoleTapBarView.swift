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
      ZStack {
        HoleShape()
        HStack(alignment: .center) {
          Spacer()
          HoleTapBarIcon(imageName: "Home", isActive: true)
          Spacer()
          HoleTapBarIcon(imageName: "Wallet", isActive: false)
          Group {
            Spacer()
            Spacer()
            Spacer()
          }
          HoleTapBarIcon(imageName: "MapPin", isActive: false)
          Spacer()
          HoleTapBarIcon(imageName: "Burger", isActive: false)
          Spacer()
        }
      }
    }    
  }
}

struct HoleTapBarIcon: View {
  let imageName: String
  let isActive: Bool
  
  var body: some View {
    if(isActive) {
      Image("\(imageName)Active")
    } else {
      Image(imageName)
    }
  }
}

struct HoleShape: View {
  let gradient = Gradient(colors: [Color("HoleTapBar_1"), Color("HoleTapBar_0")])
  let maxWidth = UIScreen.main.bounds.width
  let maxHeight: CGFloat = 60
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(RadialGradient(gradient: gradient, center: .top, startRadius: 0, endRadius: 100))
        .frame(width: maxWidth, height: maxHeight)
      Image("HoleMask")
//        .frame(width: maxWidth, height: maxHeight)
        .offset(x: 10, y: -12)
        .blendMode(.destinationOut)
    }
    .compositingGroup()
  }
}

struct HoleTapBarView_Previews: PreviewProvider {
  static var previews: some View {
    HoleTapBarView()
      .previewInterfaceOrientation(.portrait)
  }
}
