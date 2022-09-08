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
        ZStack {
          RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(Color.Button.facebook)
            .frame(width: 91, height: 58)
          Button(action: {print("Facebook submit!")}){
            Image("FB_icon")
              .frame(width: 36, height: 36, alignment: .center)
          }
        }.padding(.trailing, 14)
        
        ZStack {
          RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(Color.Button.google)
            .frame(width: 91, height: 58)
          Button(action: {print("Google submit!")}){
            Image("Google_icon")
              .frame(width: 36, height: 36, alignment: .center)
              
          }
        }.padding(.trailing, 14)
        
        ZStack {
          RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(Color.Button.apple)
            .frame(width: 91, height: 58)
          Button(action: {print("Apple submit!")}){
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
