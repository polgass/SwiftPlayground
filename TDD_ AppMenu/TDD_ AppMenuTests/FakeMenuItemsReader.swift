//
//  FakeMenuItemsReader.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation

class FakeMenuItemsReader : MenuItemsReader {
  var missingTitle: Bool = false
  
  func readMenuItems() -> ([[String : String]]?, NSError?) {
    let menuItem1 = missingTitle ? menuItem1WithMissingTitle() : menuItem1WithNoMissingTitle()
    
    let menuItem2 = [ "title": "Menu Item 2",
                     "subTitle": "Menu Item 2 subtitle",
                     "iconName": "iconName2" ]
    
    return ([menuItem1, menuItem2], nil)
  }
  
  func menuItem1WithMissingTitle() -> [String : String] {
    return [ "subTitle": "Menu Item 1 subtitle",
            "iconName": "iconName1" ]
  }
  
  func menuItem1WithNoMissingTitle() -> [String : String] {
    var menuItem = menuItem1WithMissingTitle()
    menuItem["title"] = "Menu Item 2"
    return menuItem
  }
}
