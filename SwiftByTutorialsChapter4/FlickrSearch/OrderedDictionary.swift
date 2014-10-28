//
//  OrderedDictionary.swift
//  FlickrSearch
//
//  Created by Peter Paul Sevilla on 10/28/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation

struct OrderedDictionary<KeyType: Hashable, ValueType> {
  typealias ArrayType = [KeyType]
  typealias DictionaryType = [KeyType: ValueType]
  
  var array = ArrayType()
  var dictionary = DictionaryType()
  
  // 1
  mutating func insert(value: ValueType, forKey key: KeyType, atIndex index: Int) -> ValueType? {
    var adjustedIndex = index;
    
    // 2
    let existingValue = self.dictionary[key]
    if existingValue != nil {
      // 3
      let existingIndex = find(self.array, key)!
      
      // 4
      if existingIndex < index {
        adjustedIndex--
      }
      self.array.removeAtIndex(existingIndex)
    }
    
    // 5
    self.array.insert(key, atIndex: adjustedIndex)
    self.dictionary[key] = value
    
    // 6
    return existingValue
  }
  
  // 1
  mutating func removeAtIndex(index: Int) -> (KeyType, ValueType) {
    
    // 2
    precondition(index < self.array.count, "Index out-of-bounds")
    
    // 3
    let key =  self.array.removeAtIndex(index)
    
    // 4
    let value = self.dictionary.removeValueForKey(key)!
    
    // 5
    return (key, value)
  }
}