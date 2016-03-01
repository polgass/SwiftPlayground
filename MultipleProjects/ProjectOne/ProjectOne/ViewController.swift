//
//  ViewController.swift
//  ProjectOne
//
//  Created by offshoreadmin on 01/03/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import UIKit
import ProjectCommon

class ViewController: CommonViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let person = Person(name: "Paul Sevilla", age: 100)
    person.personInfo()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

