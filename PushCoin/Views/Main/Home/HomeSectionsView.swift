//
//  HomeSectionsView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

struct HomeSectionsView: View {
  @State private var walletBalance: Double = 3724.5
  
  var body: some View {
    VStack {      
      ScrollView(.vertical, showsIndicators: false) {
        VStack {
          Spacer()
          Ellipse()
            .fill(Color.App.shape)
            .frame(width: 120, height: 130)
          HStack {
            Text(String(format: "%.2f", walletBalance))
              .foregroundColor(.white)
              .font(Font.App.largeMedium)
          }
        }.frame(height: UIScreen.main.bounds.height/3)
        
        Spacer()
          .frame(height: UIScreen.main.bounds.height/3)
        
        VStack(spacing: Geometry.Size.padding) {
          ForEach(SectionModel.sections) { section in
            HomeSectionItemView(section: section)
          }
          Spacer()
            .frame(height: 70)
        }
      }
    }
  }
}

struct HomeSectionsView_Previews: PreviewProvider {
  static var previews: some View {
    HomeSectionsView()
  }
}
