//
//  MenuItem.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation

class MenuItem {
  let title: String
  var iconName: String?
  var subtitle: String?
  
  init(title: String) {
    self.title = title
  }
}