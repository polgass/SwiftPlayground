//
//  MenuTableDefaultDataSource.swift
//  TDD_ AppMenu
//
//  Created by Paul Sevilla on 11/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation
import UIKit

class MenuTableDefaultDataSource : NSObject, MenuTableDataSource {
  var menuItems: [MenuItem]?
  
  func setMenuItems(menuItems: [MenuItem]) {
    self.menuItems = menuItems
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuItems!.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    // Ideally we should be reusing table view cells here
    let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
    let menuItem = menuItems?[indexPath.row]
    
    cell.textLabel!.text = menuItem!.title
    cell.detailTextLabel!.text = menuItem!.subtitle
    cell.imageView!.image = UIImage(named: menuItem!.iconName!)
    cell.accessoryType = .DisclosureIndicator
    
    return cell
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
}
