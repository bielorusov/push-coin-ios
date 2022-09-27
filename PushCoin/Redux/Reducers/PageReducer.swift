//
//  PageReducer.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/7/22.
//

import Foundation

struct PageReducer: ReduxReducer {
  func reduce(state: PageState?, action: ReduxAction?) -> PageState {
    let currentState = state ?? PageState.initialState
    
    guard let action = action as? PageAction else {
      return currentState
    }
    
    switch action {
      case .goTo(let page):
        return PageState(
          currentPage: page,
          previousPage: currentState.previousPage          
        )
    }
  }
}
  
