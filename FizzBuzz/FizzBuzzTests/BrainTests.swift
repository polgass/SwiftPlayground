//
//  BrainTests.swift
//  FizzBuzz
//
//  Created by Paul Sevilla on 30/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import XCTest
@testable import FizzBuzz

class BrainTests: XCTestCase {
  
  var brain: Brain!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    brain = Brain()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    brain = nil
    
    super.tearDown()
  }
  
  func testIsDivisibleByThree() {
    let result = brain.isDivisibleByThree(3)
    XCTAssertEqual(result, true)
  }
  
  func testIsNotDivisibleByThree() {
    let result = brain.isDivisibleByThree(1)
    XCTAssertFalse(result, "Number should be divisible by 3.")
  }
  
  func testIsDivisibleByFive() {
    let result = brain.isDivisibleByFive(5)
    XCTAssertEqual(result, true)
  }
  
  func testIsNotDivisibleByFive() {
    let result = brain.isDivisibleByFive(1)
    XCTAssertEqual(result, false)
  }
  
  func testIsDivisbleByFifteen() {
    let result = brain.isDivisibleByFifteen(15)
    XCTAssertEqual(result, true)
  }
  
  func testIsNotDivisbleByFifteen() {
    let result = brain.isDivisibleByFifteen(1)
    XCTAssertEqual(result, false)
  }
  
  func testSayFizz() {
    let result = brain.check(3)
    XCTAssertEqual(result, "Fizz")
  }
  
  func testSayBuzz() {
    let result = brain.check(5)
    XCTAssertEqual(result, "Buzz")
  }
  
  func testSayFizzBuzz() {
    let result = brain.check(15)
    XCTAssertEqual(result, "FizzBuzz")
  }
  
  func testSayNumber() {
    let result = brain.check(1)
    XCTAssertEqual(result, "1")
  }
}
