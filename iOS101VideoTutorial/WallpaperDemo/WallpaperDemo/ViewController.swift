//
//  ViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var currentMonth: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  @IBAction func sliderUpdated(sender: AnyObject) {
    let slider = sender as UISlider
    currentMonth.text = "\(Int(slider.value))"
  }
  
  @IBAction func close(segue: UIStoryboardSegue) {
    println("unwind")
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "GoToPaper" {
      let paperViewController = segue.destinationViewController as PaperViewController
      paperViewController.monthToShow = currentMonth.text?.toInt()
    }
  }

}

