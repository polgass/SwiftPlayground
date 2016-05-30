//
//  IceCreamStore.swift
//  IceCream
//
//  Created by Paul Sevilla on 26/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation

class IceCreamStore {
  private let flavors = ["Vanilla", "Chocolate", "Strawberry", "Coffee", "Cookies & Cream", "Rum Raisins", "Mint Chocolate Chip", "Peanut Butter Cup"]
  
  func allFlavors() -> [String] {
    return flavors
  }
}