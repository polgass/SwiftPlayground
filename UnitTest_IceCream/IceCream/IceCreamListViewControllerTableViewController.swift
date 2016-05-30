//
//  IceCreamListViewControllerTableViewController.swift
//  IceCream
//
//  Created by Paul Sevilla on 26/05/2016.
//  Copyright © 2016 Paul Sevilla. All rights reserved.
//

import UIKit

class IceCreamListViewControllerTableViewController: UITableViewController {
  
  let dataSouce = IceCreamListDataSource()
  
  // MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = dataSouce
  }
}
