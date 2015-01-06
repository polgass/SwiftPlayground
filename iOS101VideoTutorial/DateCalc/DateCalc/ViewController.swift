//
//  ViewController.swift
//  DateCalc
//
//  Created by Paul Sevilla on 1/5/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var resultsLabel: UILabel!
  var dateCalc: DateCalculator!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    dateCalc = DateCalculator()
    dateCalc.hisName = "Brian"
    dateCalc.hisAge = 40
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func calcTapped(sender: AnyObject) {
    let shouldDate = dateCalc.shouldHeDateIfHerAgeIs(24)
    if shouldDate {
      resultsLabel.text = "He should date"
    } else {
      resultsLabel.text = "He should not date"
    }
  }

}

