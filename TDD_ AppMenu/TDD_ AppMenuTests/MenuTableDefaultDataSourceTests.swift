//
//  MenuTableDefaultDataSourceTests.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import UIKit
import XCTest

class MenuTableDefaultDataSourceTests: XCTestCase {
  var dataSource: MenuTableDefaultDataSource?
  var menuItemsList: [MenuItem]?
  
  override func setUp() {
    super.setUp()
    
    let testMenuItem = MenuItem(title: "Test menu item")
    menuItemsList = [testMenuItem]
    
    dataSource = MenuTableDefaultDataSource()
    dataSource!.setMenuItems(menuItemsList!)
  }
  
  func testReturnsOneRowForOneMenuItem() {
    let numberOfRows =
      dataSource!.tableView(UITableView(), numberOfRowsInSection:0)
    
    XCTAssertEqual(numberOfRows,
                   menuItemsList!.count,
                   "Only one row is returned since we're passing one menu item")
  }
  
  func testReturnsTwoRowsForTwoMenuItems() {
    let testMenuItem1 = MenuItem(title: "Test menu item 1")
    let testMenuItem2 = MenuItem(title: "Test menu item 2")
    let menuItemsList = [testMenuItem1, testMenuItem2]
    
    dataSource!.setMenuItems(menuItemsList)
    let numberOfRows =
      dataSource!.tableView(UITableView(), numberOfRowsInSection:0)
    
    XCTAssertEqual(numberOfRows,
                   menuItemsList.count,
                   "Returns two rows as we're passing two menu items")
  }
  
  func testReturnsOnlyOneSection() {
    let numberOfSections =
      dataSource!.numberOfSectionsInTableView(UITableView())
    
    XCTAssertEqual(numberOfSections, 1,
                   "There should only be one section")
  }
  
  func testEachCellContainsTitleForRespectiveMenuItem() {
    let firstMenuItem = NSIndexPath(forRow: 0, inSection: 0)
    let cell =
      dataSource!.tableView(UITableView(),
                            cellForRowAtIndexPath: firstMenuItem)
    
    XCTAssertEqual(cell.textLabel!.text!,
                   "Test menu item",
                   "A cell contains the title of a menu item it's representing")
  }
}
