//
//  ThirdPageTableViewController.swift
//  MultipleStoryboards
//
//  Created by Paul Sevilla on 1/7/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ThirdPageTableViewController: UITableViewController {
  
  var users: [User] = [User]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let user1 = User(name: "Paul", status: "M", datePosted: "2015", avatarFname: "http://i0.wp.com/hypebeast.com/image/2013/01/hot-toys-iron-man-3-mark-xlii-collectible-bust_1.jpg?w=1410")
    let user2 = User(name: "Sheila", status: "F", datePosted: "2015", avatarFname: "http://t0.gstatic.com/images?q=tbn:ANd9GcT4PZc648WRoXzxEdLQA9zMGqBx93_um_HxvsjgYhoY3AvDtkzI")
    let user3 = User(name: "Belle", status: "F", datePosted: "2015", avatarFname: "http://i0.wp.com/hypebeast.com/image/2013/03/hot-toys-iron-man-3-iron-patriot-collectible-bust-2.jpg?w=930")
    
    users.append(user1)
    users.append(user2)
    users.append(user3)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath) as UserTableViewCell
    let user = users[indexPath.row]
    cell.user = user
    return cell
  }
  
}
