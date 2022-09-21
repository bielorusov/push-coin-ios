//
//  HomeSectionItemView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

struct HomeSectionItemView: View {
  var section: SectionModel
  @State private var showDetails = false
  
  var body: some View {
    ZStack {
      section.image
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    .onTapGesture {
      showDetails.toggle()
    }
    .sheet(isPresented: $showDetails) {
      HomeSectionDetailView(section: section)
    }
  }  
}

struct HomeSectionItemView_Previews: PreviewProvider {
  static var previews: some View {
    HomeSectionItemView(section: SectionModel.sections[1])
  }
}
