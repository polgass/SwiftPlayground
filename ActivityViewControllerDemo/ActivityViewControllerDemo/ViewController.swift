//
//  ViewController.swift
//  ActivityViewControllerDemo
//
//  Created by Peter Paul Sevilla on 06/11/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var textField: UITextField!
  
  var activityViewController:UIActivityViewController?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    
    return true
  }
  
  @IBAction func shareText(sender: UIButton) {
    let activityViewController = UIActivityViewController(
      activityItems: [textField.text! as String, UIImage(named: "chat")!],
      applicationActivities: nil)
    
    presentViewController(activityViewController, animated: true, completion: nil)
  }

}

