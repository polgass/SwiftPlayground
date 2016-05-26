//
//  MenuItemsReader.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation

protocol MenuItemsReader {
  func readMenuItems() -> ([[String : String]]?, NSError?)
}