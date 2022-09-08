//
//  SocialPlateView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct SocialPlateView: View {
  let fullSize: Bool
  
  init(fullSize: Bool = true) {
    self.fullSize = fullSize
  }
  
  var body: some View {
    let iconWidth: CGFloat = fullSize ? 91 : 58
    let iconHeight: CGFloat = fullSize ? 36 : 28
    
    HStack(spacing: 0) {
      Button(action: {
        print("Facebook submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.facebook)
          .frame(width: iconWidth, height: 58)
          .overlay {
            Image("FB_icon")
              .frame(width: iconHeight, height: iconHeight, alignment: .center)
          }
      }.padding(.trailing, Geometry.Size.padding)
      
      Button(action: {
        print("Google submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.google)
          .frame(width: iconWidth, height: 58)
          .overlay {
            Image("Google_icon")
              .frame(width: iconHeight, height: iconHeight, alignment: .center)
          }
      }.padding(.trailing, Geometry.Size.padding)
            
      Button(action: {
        print("Apple submit!")
      }){
        RoundedRectangle(cornerRadius: 15, style: .continuous)
          .fill(Color.Button.apple)
          .frame(width: iconWidth, height: 58)
          .overlay {
            Image("Apple_icon")
              .frame(width: iconHeight, height: iconHeight, alignment: .center)
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
