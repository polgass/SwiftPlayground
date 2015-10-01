//
//  ViewController.swift
//  LocalyticsDemo
//
//  Created by Paul Sevilla on 2/10/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    println("Testing 123")
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    Localytics.tagScreen("View Controller")
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func button1Tapped(sender: AnyObject) {
    let attr = ["display units": "miles per hour", "age range": "18-25"]
    
    Localytics.tagEvent("Button One Tapped", attributes: attr)
    
    println("Button One Tapped")
  }
  
  @IBAction func button2Tapped(sender: AnyObject) {
    Localytics.tagEvent("Button Two Tapped")
    println("Button Two Tapped")
  }
  
  @IBAction func button3Tapped(sender: AnyObject) {
    Localytics.tagEvent("Button Three Tapped")
    println("Button Three Tapped")
  }
  

}

