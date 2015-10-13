//
//  ViewController.swift
//  UnitTestExampleSwift2.0
//
//  Created by Peter Paul Sevilla on 13/10/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var aValue = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func doThis() -> Bool {
    aValue = true
    return aValue
  }
  
}

