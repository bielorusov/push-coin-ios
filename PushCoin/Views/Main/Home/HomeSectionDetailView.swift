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
        Button(action: {
          dismiss()
        }){
          Image(systemName: "chevron.down")
            .resizable()
            .frame(width: 40, height: 6)
            .foregroundColor(.black)
            .opacity(0.5)
        }
      }.offset(y: 20)
      
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
