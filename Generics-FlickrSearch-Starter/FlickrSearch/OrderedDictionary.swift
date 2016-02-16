//
//  OrderedDictionary.swift
//  FlickrSearch
//
//  Created by Peter Paul Sevilla on 15/02/2016.
//  Copyright © 2016 Razeware. All rights reserved.
//

import Foundation

struct OrderedDictionary<KeyType: Hashable, ValueType> {
  typealias ArrayType = [ValueType]
  typealias DictionaryType = [KeyType: ValueType]
  
  var array = ArrayType()
  var dictionary = DictionaryType()
  
  // 1
  mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType? {
    var adjustedIndex = index
    
    let arr = ["a","b","c"]
    
    let indexOfA = arr.indexOf("a") // 0
    let indexOfB = arr.indexOf("b") // 1
    let indexOfD = arr.indexOf("d") // nil
    
    // 2
    let existingValue = self.dictionary[key]
    if existingValue != nil {
      // 3
      let exustingIndex = self.array.indexOf(try! key)
      
      let existingIndex = find(self.array, key)!
      
      // 4
      if existingIndex < index {
        adjustedIndex--
      }
      self.array.removeAtIndex(existingIndex)
    }
    
    // 5
    self.array.insert(key, atIndex:adjustedIndex)
    self.dictionary[key] = value
    
    // 6
    return existingValue
  }
}