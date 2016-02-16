//
//  ViewController.swift
//  SampleActionExtensionApp
//
//  Created by Peter Paul Sevilla on 06/11/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var textView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func actionButtonPressed(sender: AnyObject) {
    let activityVC = UIActivityViewController(activityItems: [textView.text], applicationActivities: nil)
    presentViewController(activityVC, animated: true, completion: nil)
  }

}

