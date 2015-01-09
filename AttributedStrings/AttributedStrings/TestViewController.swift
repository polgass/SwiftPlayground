//
//  TestViewController.swift
//  AttributedStrings
//
//  Created by Paul Sevilla on 1/9/15.
//  Copyright (c) 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.leftBarButtonItem = nil;
    navigationItem.hidesBackButton = true
    
    var backButton = UIBarButtonItem(title: "Balik", style: UIBarButtonItemStyle.Plain, target: self, action: "back")
    navigationItem.leftBarButtonItem = backButton
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func back() {
    navigationController?.popViewControllerAnimated(true)
  }
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
