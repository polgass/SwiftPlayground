//
//  ViewController.swift
//  CellForceExpand
//
//  Created by Peter Paul Sevilla on 14/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

let kSummary = "Activists chanted anti-China slogans in the Vietnamese capital on Monday to mark the anniversary of a 1988 battle in the Spratly Islands, a rare act of protest over an issue that has come to dog relations between Hanoi and Beijing. In 1988 China launched an attack"

class ViewController: UIViewController {

  var summary = kSummary
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    tableView.registerNib(ExpandingCell.nib(), forCellReuseIdentifier: ExpandingCell.reuseIdentifier())
    
    tableView.estimatedRowHeight = 80.0
    tableView.rowHeight = UITableViewAutomaticDimension
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("ExpandingCell") as! ExpandingCell
    cell.delegate = self
    cell.summary = summary
    return cell
  }
}

extension ViewController: ExpandingCellDelegate {
  func updateSummary(text: String) {
    summary = text
    tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 0, inSection: 0)], withRowAnimation: .Automatic)
  }
}

