//
//  IceCreamListDataSource.swift
//  IceCream
//
//  Created by Paul Sevilla on 26/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import Foundation
import UIKit

class IceCreamListDataSource: NSObject, UITableViewDataSource {

  let dataStore = IceCreamStore()
  
  // MARK:- UITableViewDataSource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataStore.allFlavors().count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let flavor = dataStore.allFlavors()[indexPath.row]
    let cell = tableView.dequeueReusableCellWithIdentifier("IceCreamListCell", forIndexPath: indexPath)
    cell.textLabel?.text = flavor
    return cell
  }

}