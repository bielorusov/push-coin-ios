//
//  HomeSectionDetailView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

struct HomeSectionDetailView: View {
  var section: SectionModel
  @Environment(\.dismiss) var dismiss
  
  var body: some View {
    VStack {
      HStack {
        Spacer()
        Button(action: {
          dismiss()
        }){
          Image(systemName: "xmark")
            .foregroundColor(.gray)
        }
      }
      .frame(width: Geometry.Size.inputFieldWidth)
      .padding(.top, Geometry.Size.padding)
      
      ScrollView(.vertical, showsIndicators: false) {
        VStack(spacing: Geometry.Size.padding) {
          section.image
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .scaledToFill()
          
          Text(section.title).font(Font.App.title)
          
          HStack {
            Text(section.text)
              .font(Font.App.body)
              .fixedSize(horizontal: false, vertical: true)
          }
          Spacer()
        }
        .frame(width: Geometry.Size.inputFieldWidth)
      }.padding(.top, 30)
    }
  }
}

struct HomeSectionDetailView_Previews: PreviewProvider {
  static var previews: some View {
    HomeSectionDetailView(section: SectionModel.sections[0])
  }
}
