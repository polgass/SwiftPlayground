//
//  DateCalculator.swift
//  DateCalc
//
//  Created by Paul Sevilla on 1/5/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import Foundation

class DateCalculator {
  
  var hisAge: Float = 0
  var hisName: String?
  
  init() {
  
  }
  
  func shouldHeDateIfHerAgeIs(herAge: Float) -> Bool {
    let minAgeToDate = hisAge / 2 + 7
    return herAge > minAgeToDate
  }
  
  

}