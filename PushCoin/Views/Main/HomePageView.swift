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
      
      VStack {
        Text("3000 P")
          .foregroundColor(.white)
          .font(Font.App.largeMedium)
          .offset(x: 0, y: -UIScreen.main.bounds.height/5 )
      }
      
      ScrollView(showsIndicators: false) {
        VStack(spacing: Geometry.Size.padding) {
          Spacer()
            .frame(height: UIScreen.main.bounds.height * 2/3)
          Image("section_1")
            .clipShape(RoundedRectangle(cornerRadius: 30))
          Image("section_2")
            .clipShape(RoundedRectangle(cornerRadius: 30))
          Image("section_3")
            .clipShape(RoundedRectangle(cornerRadius: 30))
          ForEach(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
            Image("section_4")
            .clipShape(RoundedRectangle(cornerRadius: 30))
          }
          Spacer()
            .frame(height: 70)
        }
      }
    }
  }
}

struct HomePageView_Previews: PreviewProvider {
  static var previews: some View {
    HomePageView()
  }
}
