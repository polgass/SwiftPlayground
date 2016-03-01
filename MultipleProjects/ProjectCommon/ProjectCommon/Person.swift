//
//  Person.swift
//  ProjectCommon
//
//  Created by offshoreadmin on 01/03/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import Foundation

public class Person {
  var name: String?
  var age: Int?
  
  public init(name: String, age: Int) {
    self.name = name
    self.age = age
  }
  
  public func personInfo() {
    print("The person's name is \(name!)")
  }
}