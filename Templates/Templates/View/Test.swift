//
//  Test.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 10/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

@IBDesignable
class Test: UIView {
  @IBOutlet var contentView: UIView!
  @IBOutlet weak var backgroundView: UIView!
  @IBOutlet weak var titleLabel: UILabel!
  
  @IBInspectable var bgColor: UIColor = UIColor.whiteColor() {
    didSet {
      layer.backgroundColor = bgColor.CGColor
    }
  }
  
  @IBInspectable var text: String? {
    didSet {
      titleLabel.text = "ddsds"
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    NSBundle.mainBundle().loadNibNamed("Test", owner: self, options: nil)
    contentView.frame = frame
    addSubview(contentView)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    NSBundle.mainBundle().loadNibNamed("Test", owner: self, options: nil)
    contentView.frame = frame
    addSubview(contentView)
  }
  
  func changeColor(color: UIColor) {
    backgroundView.backgroundColor = color
  }
  
}
