//
//  ViewController.swift
//  MultiTargetDemo
//
//  Created by offshoreadmin on 01/03/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    #if ONE
      print("First target!")
    #else
      print("Second target!")
    #endif
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

