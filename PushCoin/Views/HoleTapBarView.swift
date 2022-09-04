//
//  HoleTapBarView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI

struct HoleTapBarView: View {
  @StateObject var viewRouter: ViewRouter
  
  var body: some View {
    VStack{
      ZStack {
        HoleShape()
        HStack(alignment: .center) {
          Spacer()
          HoleTapBarIcon(imageName: "Home", assignedPage: .home, viewRouter: viewRouter)
          Spacer()
          HoleTapBarIcon(imageName: "Wallet", assignedPage: .wallet, viewRouter: viewRouter)
          Group {
            Spacer()
            Spacer()
            Spacer()
          }
          HoleTapBarIcon(imageName: "MapPin", assignedPage: .mapPin, viewRouter: viewRouter)
          Spacer()
          HoleTapBarIcon(imageName: "Burger", assignedPage: .burger, viewRouter: viewRouter)
          Spacer()
        }
      }
    }
  }
}

struct HoleTapBarIcon: View {
  let imageName: String
  let assignedPage: Page
  @StateObject var viewRouter: ViewRouter
  
  var body: some View {
    VStack {
      viewRouter.currentPage == assignedPage ? Image("\(imageName)Active") : Image(imageName)
    }
    .onTapGesture {
      viewRouter.currentPage = assignedPage
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
    HoleTapBarView(viewRouter: ViewRouter())
      .previewInterfaceOrientation(.portraitUpsideDown)
  }
}
