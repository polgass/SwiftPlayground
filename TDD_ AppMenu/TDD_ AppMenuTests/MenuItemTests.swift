//
//  MenuItemTests.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import XCTest

class MenuItemTests: XCTestCase {
  var menuItem: MenuItem?
  
  override func setUp() {
    super.setUp()
    menuItem = MenuItem(title: "Contributions")
  }
  
  override func tearDown() {
    menuItem = nil
    super.tearDown()
  }
  
  func testThatMenuItemHasATitle() {
    XCTAssertEqual(menuItem!.title, "Contributions",
                   "A title should always be present")
  }
  
  func testThatMenuItemCanBeAssignedASubtitle() {
    menuItem!.subtitle = "Repos contributed to"
    XCTAssertEqual(menuItem!.subtitle, "Repos contributed to")
  }
  
  func testThatMenuItemCanBeAssignedAnIconName() {
    menuItem!.iconName = "iconContributions"
    
    XCTAssertEqual(menuItem!.iconName, "iconContributions",
                   "Icon name should be what we assigned")
  }
  
  
}
