//
//  ViewController.swift
//  AttributedStrings
//
//  Created by Peter Paul Sevilla on 1/8/15.
//  Copyright (c) 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var myString:NSString = "I Love Pizza!"
  var myMutableString = NSMutableAttributedString()

  @IBOutlet weak var myLabel: UILabel!
  
  @IBAction func myFontButton(sender: UIButton) {
    println(sender.titleLabel!.text!)
    myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: sender.titleLabel!.text!, size: 24.0)!, range: NSRange(location: 7,length: 5))
    myLabel.attributedText = myMutableString
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    myMutableString = NSMutableAttributedString(string: myString, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 18.0)!])
    //Add more attributes here
    myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "Chalkduster", size: 24.0)!, range: NSRange(location: 7,length: 5))
    myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "AmericanTypewriter-Bold", size: 18.0)!, range: NSRange(location:2,length:4))
    myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:2,length:4))
    myMutableString.addAttribute(NSFontAttributeName, value: UIFont(name: "Georgia", size: 36.0)!, range: NSRange(location: 0, length: 1))
    myMutableString.addAttribute(NSStrokeColorAttributeName, value: UIColor.blueColor(), range:  NSRange(location: 0, length: 1))
    myMutableString.addAttribute(NSStrokeWidthAttributeName, value: 2, range: NSRange(location: 0, length: 1))
    myMutableString.addAttribute(NSBackgroundColorAttributeName, value: UIColor.greenColor(), range: NSRange(location: 0, length: myString.length))
    myLabel.backgroundColor = UIColor.grayColor()
    myLabel.attributedText = myMutableString //Apply to the label
    
    // navbar color
    navigationController?.navigationBar.barTintColor = UIColor.blueColor()
    
    // navbar Status bar white font
    navigationController?.navigationBar.barStyle = UIBarStyle.Black
    navigationController?.navigationBar.tintColor = UIColor.whiteColor()
  
    
    // navbar title
    let theTitle = "AttributedString"
    var attributedString = NSMutableAttributedString(string: theTitle, attributes: [NSFontAttributeName: UIFont(name: "Georgia", size: 14.0)!])
    attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.redColor(), range: NSRange(location:2,length:4))
    
    var label = UILabel()
    label.textAlignment = NSTextAlignment.Center
    label.attributedText = attributedString
    label.sizeToFit()
    
    navigationItem.titleView = label
  }
}

