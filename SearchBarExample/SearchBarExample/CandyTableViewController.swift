//
//  CandyTableViewController.swift
//  SearchBarExample
//
//  Created by Paul Sevilla on 1/23/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class CandyTableViewController: UITableViewController, UISearchBarDelegate, UISearchDisplayDelegate {
  
  var candies = [Candy]()
  var filteredCandies = [Candy]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Sample Data for candyArray
    self.candies = [Candy(category:"Chocolate", name:"chocolate Bar"),
      Candy(category:"Chocolate", name:"chocolate Chip"),
      Candy(category:"Chocolate", name:"dark chocolate"),
      Candy(category:"Hard", name:"lollipop"),
      Candy(category:"Hard", name:"candy cane"),
      Candy(category:"Hard", name:"jaw breaker"),
      Candy(category:"Other", name:"caramel"),
      Candy(category:"Other", name:"sour chew"),
      Candy(category:"Other", name:"gummi bear")]
    
    // Reload the table
    self.tableView.reloadData()
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == self.searchDisplayController!.searchResultsTableView {
      return self.filteredCandies.count
    } else {
      return self.candies.count
    }
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    //ask for a reusable cell from the tableview, the tableview will create a new one if it doesn't have any
    let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell") as UITableViewCell
    
    var candy : Candy
    // Check to see whether the normal table or search results table is being displayed and set the Candy object from the appropriate array
    if tableView == self.searchDisplayController!.searchResultsTableView {
      candy = filteredCandies[indexPath.row]
    } else {
      candy = candies[indexPath.row]
    }
    
    // Configure the cell
    cell.textLabel!.text = candy.name
    cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
    
    return cell
  }
  
  func filterContentForSearchText(searchText: String) {
    // Filter the array using the filter method
    self.filteredCandies = self.candies.filter({( candy: Candy) -> Bool in
      //let categoryMatch = (scope == "All") || (candy.category == scope)
      let stringMatch = candy.name.rangeOfString(searchText)
      //return categoryMatch && (stringMatch != nil)
      return stringMatch != nil
    })
  }
  
  // UISearchDisplayControllerDelegate delegates
  func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchString searchString: String!) -> Bool {
    self.filterContentForSearchText(searchString)
    return true
  }
  
  func searchDisplayController(controller: UISearchDisplayController!, shouldReloadTableForSearchScope searchOption: Int) -> Bool {
    self.filterContentForSearchText(self.searchDisplayController!.searchBar.text)
    return true
  }
  
  func searchDisplayController(controller: UISearchDisplayController, didShowSearchResultsTableView tableView: UITableView) {
//    searchDisplayController?.searchResultsTableView.backgroundColor = UIColor.redColor()
  }
  
  func searchDisplayControllerWillBeginSearch(controller: UISearchDisplayController) {
    var tableView = controller.searchResultsTableView
    tableView!.backgroundColor = UIColor.redColor()
  }
  
}
