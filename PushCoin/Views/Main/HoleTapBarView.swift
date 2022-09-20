//
//  HoleTapBarView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/2/22.
//

import SwiftUI

struct HoleTapBarView: View {
  @EnvironmentObject var store: AppStore
  
  var body: some View {
    VStack{
      ZStack {
        HoleShape()
        HStack(alignment: .center) {
          Spacer()
          HoleTapBarIconView(imageName: "Home", assignedPage: .home)
          Spacer()
          HoleTapBarIconView(imageName: "Wallet", assignedPage: .wallet)
          Spacer(minLength: UIScreen.main.bounds.width/3)
          HoleTapBarIconView(imageName: "MapPin", assignedPage: .mapPin)
          Spacer()
          HoleTapBarIconView(imageName: "Burger", assignedPage: .burger)
          Spacer()
        }
        
        switch store.state.pageState.currentPage {
          case .home:
            MapCircleButtonView()
          case .mapPin:
            CamCircleButtonView()
          default:
            MapCircleButtonView()
        }
      }
    }
  }
}

struct HoleTapBarIconView: View {
  @EnvironmentObject var store: AppStore
  
  let imageName: String
  let assignedPage: Page
  
  var body: some View {
    VStack {
      Button(action: {
        self.store.dispatch(PageAction.goTo(assignedPage))
      }) {
        if store.state.pageState.currentPage == assignedPage {
          Image("\(imageName)Active")
        } else {
          Image(imageName)
        }
      }
    }
  }
}

struct HoleShape: View {
  let maxWidth = UIScreen.main.bounds.width
  let maxHeight: CGFloat = 60
  
  var body: some View {
    ZStack {
      Rectangle()
        .fill(RadialGradient(gradient: Gradient.tapBar, center: .top, startRadius: 0, endRadius: 100))
        .frame(width: maxWidth, height: maxHeight)
        .inverseMask(
          Image("HoleMask")
            .frame(width: maxWidth, height: maxHeight)
            .offset(x: 3, y: -12)
            .blendMode(.destinationOut)
        )
    }
    
//    .compositingGroup()
  }
}

struct MapCircleButtonView: View {
  var body: some View {
    Button(action: {
      print("Map button Pressed")
    }) {
      CircleButtonView(
        image: Image("MapIcon")
      )
    }
  }
}

struct CamCircleButtonView: View {
  var body: some View {
    Button(action: {
      print("Camera button Pressed")
    }) {
      CircleButtonView(
        image: Image(systemName: "camera.viewfinder")
      )
    }
  }
}

struct CircleButtonView: View {
  let image: Image
  
  var body: some View {
    ZStack {
      Circle()
        .fill(LinearGradient(
          gradient: Gradient.circleButton,
          startPoint: .top,
          endPoint: .bottom))
        .frame(width: 56, height: 56, alignment: .center)
      image
        .font(.title)
        .foregroundColor(.white)
        .frame(width: 56, height: 56, alignment: .center)
      
    }.offset(x: 0, y: -18)
  }
}

struct HoleTapBarView_Previews: PreviewProvider {
  static var previews: some View {
    HoleTapBarView()
      .environmentObject(Core.initedStore)
      .previewInterfaceOrientation(.portrait)
  }
}
