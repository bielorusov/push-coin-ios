//
//  HomeSectionsView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

struct HomeSectionsView: View {
  var body: some View {
    VStack {      
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: Geometry.Size.padding) {
          Spacer()
            .frame(height: UIScreen.main.bounds.height * 2/3)
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
