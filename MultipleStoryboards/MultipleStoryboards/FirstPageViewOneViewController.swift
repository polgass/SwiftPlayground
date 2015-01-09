//
//  FirstPageViewOneViewController.swift
//  MultipleStoryboards
//
//  Created by Paul Sevilla on 1/7/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class FirstPageViewOneViewController: UIViewController {
  
  var settingsIsToggled = false

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    var settingsButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: "toggleSettings")

    parentViewController!.title = "First Page"
    parentViewController!.navigationItem.leftBarButtonItem = settingsButton
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func toggleSettings() {
    println(settingsIsToggled)
    if settingsIsToggled {
      slidingViewController().resetTopViewAnimated(true)
      settingsIsToggled = false
    } else {
      slidingViewController().anchorTopViewToRightAnimated(true)
      settingsIsToggled = true
    }
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
