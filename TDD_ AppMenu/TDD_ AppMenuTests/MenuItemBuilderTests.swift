//
//  MenuItemBuilderTests.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import UIKit
import XCTest

class MenuItemBuilderTests: XCTestCase {
  var menuItemBuilder: MenuItemBuilder?
  var fakeMenuItemsReader: FakeMenuItemsReader?
  var menuItems: [MenuItem]?
  var error: NSError?
  
  override func setUp() {
    fakeMenuItemsReader = FakeMenuItemsReader()
    fakeMenuItemsReader!.missingTitle = true
    let (metadata, _) = fakeMenuItemsReader!.readMenuItems()
    
    menuItemBuilder = MenuItemBuilder()
    
    (menuItems, error) =
      menuItemBuilder!.buildMenuItemsFromMetadata(metadata!)
  }
  
  func testCorrectErrorDomainIsReturnedWhenTitleIsMissing() {
    let errorDomain = error?.domain
    XCTAssertEqual(errorDomain!, MenuItemBuilderErrorDomain,
                   "Correct error domain is returned")
  }
  
  func testMissingTitleErrorCodeIsReturnedWhenTitleIsMissing() {
    let errorCode = error?.code
    XCTAssertEqual(errorCode!,
                   MenuItemBuilderErrorCode.MissingTitle.rawValue,
                   "Correct error code is returned")
  }
  
  func testCorrectErrorDescriptionIsReturnedWhenTitleIsMissing() {
    let userInfo = error?.userInfo
    let description: String =
      userInfo![NSLocalizedDescriptionKey]! as! String
    
    XCTAssertEqual(description,
                   "All menu items must have a title",
                   "Correct error description is returned")
  }
  
  func testEmptyArrayIsReturnedWhenErrorIsPresent() {
    XCTAssertTrue(menuItems?.count == 0,
                  "No menu item instances are returned when error is present")
  }
  
  func testOneMenuItemInstanceIsReturnedForEachDictionary() {
    fakeMenuItemsReader!.missingTitle = false
    let (metadata, _) = fakeMenuItemsReader!.readMenuItems()
    
    (menuItems, _) = menuItemBuilder!.buildMenuItemsFromMetadata(metadata!)
    
    XCTAssertTrue(menuItems?.count == 2, "Number of menu items should be equal to number of dictionaries")
  }
  
  func testMenuItemPropertiesContainValuesPresentInDictionary() {
    fakeMenuItemsReader!.missingTitle = false
    let (metadata, _) = fakeMenuItemsReader!.readMenuItems()
    
    (menuItems, _) =
      menuItemBuilder!.buildMenuItemsFromMetadata(metadata!)
    
    let rawDictionary1 = metadata![0]
    let menuItem1 = menuItems![0]
    
    XCTAssertEqual(menuItem1.title,
                   rawDictionary1["title"]!,
                   "1st menu item's title should be what's in the 1st dictionary")
    
    XCTAssertEqual(menuItem1.subtitle!,
                   rawDictionary1["subTitle"]!,
                   "1st menu item's subTitle should be what's in the 1st dictionary")
    
    XCTAssertEqual(menuItem1.iconName!,
                   rawDictionary1["iconName"]!,
                   "1st menu item's icon name should be what's in the 1st dictionary")
    
    let rawDictionary2 = metadata![1]
    let menuItem2 = menuItems![1]
    
    XCTAssertEqual(menuItem2.title,
                   rawDictionary2["title"]!,
                   "2nd menu item's title should be what's in the 2nd dictionary")
    
    XCTAssertEqual(menuItem2.subtitle!,
                   rawDictionary2["subTitle"]!,
                   "2nd menu item's subTitle should be what's in the 2nd dictionary")
    
    XCTAssertEqual(menuItem2.iconName!,
                   rawDictionary2["iconName"]!,
                   "2nd menu item's icon name should be what's in the 2nd dictionary")
  }
}
