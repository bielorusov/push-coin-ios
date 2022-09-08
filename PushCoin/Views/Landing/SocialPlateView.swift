//
//  SocialPlateView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SocialPlateView: View {
  var body: some View {
    HStack(spacing: 0) {
      Button(action: {
        print("Facebook submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.facebook)
          .frame(width: 91, height: 58)
          .overlay {
            Image("FB_icon")
              .frame(width: 36, height: 36, alignment: .center)
          }
      }.padding(.trailing, Geometry.Size.padding)
      
      Button(action: {
        print("Google submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.google)
          .frame(width: 91, height: 58)
          .overlay {
            Image("Google_icon")
              .frame(width: 36, height: 36, alignment: .center)
          }
      }.padding(.trailing, Geometry.Size.padding)
            
      Button(action: {
        print("Apple submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.apple)
          .frame(width: 91, height: 58)
          .overlay {
            Image("Apple_icon")
              .frame(width: 36, height: 36, alignment: .center)
          }
      }
    }
  }
}

struct SocialPlateView_Previews: PreviewProvider {
  static var previews: some View {
    SocialPlateView()
  }
}
