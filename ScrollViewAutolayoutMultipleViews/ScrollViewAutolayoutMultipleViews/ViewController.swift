//
//  ViewController.swift
//  ScrollViewAutolayoutMultipleViews
//
//  Created by Paul Sevilla on 1/17/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var content1WidthContraint: NSLayoutConstraint!
  @IBOutlet weak var content1HeightConstraint: NSLayoutConstraint!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    content1WidthContraint.constant = 500
    content1HeightConstraint.constant = 500
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

