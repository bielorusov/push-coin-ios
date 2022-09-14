//
//  FourDigitsFieldView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/12/22.
//

import SwiftUI

struct FourDigitsFieldView: View {
  @Binding var code: FourDigitsCodeModel

  enum FormFocusable: Hashable {
    case first
    case second
    case third
    case fourth
  }
  
  @FocusState private var focusedField: FormFocusable?

  var body: some View {
    HStack(spacing: 0) {
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.Button.gray)
        .frame(width: 50,height: 52, alignment: .center)
      .overlay {
        TextField("X", text: $code.first)
          .focused($focusedField, equals: .first)
          .lineLimit(1)
          .multilineTextAlignment(.center)
          .keyboardType(.numberPad)
          .font(Font.App.inputMedium)
      }
      .padding(.trailing, Geometry.Size.padding)
      
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.Button.gray)
        .frame(width: 50,height: 52, alignment: .center)
      .overlay {
        TextField("X", text: $code.second)
          .focused($focusedField, equals: .second)
          .lineLimit(1)
          .multilineTextAlignment(.center)
          .keyboardType(.numberPad)
          .font(Font.App.inputMedium)
      }
      .padding(.trailing, Geometry.Size.padding)
      
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.Button.gray)
        .frame(width: 50,height: 52, alignment: .center)
      .overlay {
        TextField("X", text: $code.third)
          .focused($focusedField, equals: .third)
          .lineLimit(1)
          .multilineTextAlignment(.center)
          .keyboardType(.numberPad)
          .font(Font.App.inputMedium)
      }
      .padding(.trailing, Geometry.Size.padding)
      
      RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.Button.gray)
        .frame(width: 50,height: 52, alignment: .center)
      .overlay {
        TextField("X", text: $code.fourth)
          .focused($focusedField, equals: .fourth)
          .lineLimit(1)
          .multilineTextAlignment(.center)
          .keyboardType(.numberPad)
          .font(Font.App.inputMedium)
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
        focusedField = .first
      }
    }
  }
}

struct FourDigitsFieldView_Previews: PreviewProvider {
    static var previews: some View {
      ZStack {
        FourDigitsFieldView(code: .constant(FourDigitsCodeModel()))
      }
    }
}
