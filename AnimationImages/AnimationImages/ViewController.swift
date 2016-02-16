//
//  ViewController.swift
//  AnimationImages
//
//  Created by Peter Paul Sevilla on 22/01/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var bubbleImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    bubbleImageView.animationImages = [
      UIImage(named: "bubble 1")!,
      UIImage(named: "bubble 1")!,
      UIImage(named: "bubble 1")!,
      UIImage(named: "bubble 1")!,
      UIImage(named: "bubble 1")!,
      UIImage(named: "bubble 2")!,
      UIImage(named: "bubble 3")!,
      UIImage(named: "bubble 4")!,
      UIImage(named: "bubble 5")!,
      UIImage(named: "bubble 6")!,
      UIImage(named: "bubble 7")!,
      UIImage(named: "bubble 8")!,
      UIImage(named: "bubble 9")!,
      UIImage(named: "bubble 10")!,
      UIImage(named: "bubble 11")!,
      UIImage(named: "bubble 12")!,
    ]
    
    bubbleImageView.animationDuration = 1.0
    bubbleImageView.startAnimating()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

