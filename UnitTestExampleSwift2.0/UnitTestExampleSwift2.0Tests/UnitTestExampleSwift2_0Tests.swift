//
//  UnitTestExampleSwift2_0Tests.swift
//  UnitTestExampleSwift2.0Tests
//
//  Created by Peter Paul Sevilla on 13/10/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import XCTest
@testable import UnitTestExampleSwift2_0

class UnitTestExampleSwift2_0Tests: XCTestCase {
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testSomeFuncx() {
    let model = MyModel()
    XCTAssert(model.someFunc(), "this should be true")
  }
  
}
