//
//  PercentageCalculatorTests.swift
//  PercentageCalculatorTests
//
//  Created by Maxime Defauw on 03/02/16.
//  Copyright © 2016 App Coda. All rights reserved.
//

import XCTest
@testable import PercentageCalculator

class PercentageCalculatorTests: XCTestCase {
  
  var vc: ViewController!
  
  override func setUp() {
    super.setUp()
    
    let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    vc = storyboard.instantiateInitialViewController() as! ViewController
    let _ = vc.view
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testPercentageCalculator() {
    // given
    let number: Float = 50.0
    let percentage: Float = 50.0
    
    // when
    let p = vc.percentage(number, percentage)
    
    // then
    XCTAssert(p == 25, "Wrong results.")
  }
  
  func testLabelValuesShowedProperly() {
    // given
    let nv: Float = 80.0
    let pv: Float = 50.0
    let rv: Float = 40.0
    
    // when (80 * 0.5 = 40)
    vc.updateLabels(nv, pv, rv)
    
    // then
    XCTAssertTrue(vc.numberLabel.text == "80.0", "numberLabel doesn't show the right text")
    XCTAssertTrue(vc.percentageLabel.text == "50.0%", "percentageLabel doesn't show the right text")
    XCTAssertTrue(vc.resultLabel.text == "40.0", "resultLabel doesn't show the right text")
  }
}
