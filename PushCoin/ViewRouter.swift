//
//  ViewRouter.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/3/22.
//

import Foundation

class ViewRouter: ObservableObject {
  @Published var currentPage: Page = .home
}

enum Page {
  case home
  case wallet
  case mapPin
  case burger
}
