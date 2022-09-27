//
//  SectionModel.swift
//  PushCoin
//
//  Created by Dmitriy Belorusov on 9/20/22.
//

import SwiftUI

struct SectionModel: Identifiable {
  var id = UUID()
  var title: String
  var text: String
  var image: Image
  
  static var title: String {
    "Lorem Ipsum is simply"
  }
  static var content: String {
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
  }
  
  static var sections: [SectionModel] {
    [
      SectionModel(title: "\(title) 1", text: content, image: Image("section_1")),
      SectionModel(title: "\(title) 2", text: content, image: Image("section_2")),
      SectionModel(title: "\(title) 3", text: content, image: Image("section_3")),
      SectionModel(title: "\(title) 4", text: content, image: Image("section_4")),
      SectionModel(title: "\(title) 5", text: content, image: Image("section_1")),
      SectionModel(title: "\(title) 6", text: content, image: Image("section_3")),
      SectionModel(title: "\(title) 7", text: content, image: Image("section_2"))
    ]
  }
}
