//
//  ViewController.swift
//  TTTAtributedLabelExample
//
//  Created by Paul Sevilla on 2/10/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var label: TTTAttributedLabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let ass = NSAttributedString(string: "... Read More")
    
    /*
    var label = TTTAttributedLabel(frame: CGRectMake(0, 0, 300, 100))
    */
    //var lbl = label as TTTAttributedLabel
    label.font = UIFont.systemFontOfSize(14)
    label.textColor = UIColor.darkGrayColor()
    label.lineBreakMode = NSLineBreakMode.ByTruncatingTail
    label.numberOfLines = 3
    label.attributedTruncationToken = ass
    
    label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum ultrices hendrerit arcu eu commodo. Nam ac orci justo. Proin vitae felis eget felis commodo maximus. In iaculis, sem in elementum maximus, quam ligula mollis ligula, nec porttitor augue ligula non turpis. Donec mollis turpis tincidunt sagittis consequat. In eu nibh sed justo ultricies viverra. Aliquam nec elit et nunc ultrices tempus. Pellentesque in erat sapien. Aliquam sollicitudin leo sit amet nulla lobortis, nec efficitur magna egestas."
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

