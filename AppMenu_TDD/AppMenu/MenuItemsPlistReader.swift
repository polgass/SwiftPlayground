//
//  MenuItemsPlistReader.swift
//  AppMenu
//
//  Created by offshoreadmin on 22/02/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import Foundation
class MenuItemsPlistReader: MenuItemsReader {
  var plistToReadFrom: String? = nil
  
  func readMenuItems() -> ([[String : String]]?, NSError?) {
    let error = NSError(domain: "Some domain",
      code: 0,
      userInfo: nil)
    return ([], error)
  }
}