//
//  PageAction.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/7/22.
//

import Foundation


enum PageAction: ReduxAction {
  case goTo(_ page: Page)
}
