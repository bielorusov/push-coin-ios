//
//  LabelledDividerView.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/8/22.
//

import SwiftUI

struct LabelledDivider: View {
    let label: String
    let color: Color

    init(label: String, color: Color = .black) {
        self.label = label
        self.color = color
    }

    var body: some View {
      HStack(spacing: Geometry.Size.padding) {
            line
            Text(label)
              .font(Font.App.plain)
              .foregroundColor(color)
            line
        }
    }

    var line: some View {
        VStack { Divider().background(color) }
    }
}
