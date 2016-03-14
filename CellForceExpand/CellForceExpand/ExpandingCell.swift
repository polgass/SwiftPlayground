//
//  ExpandingCell.swift
//  CellForceExpand
//
//  Created by Peter Paul Sevilla on 14/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

protocol ExpandingCellDelegate {
  func updateSummary(text: String)
}

class ExpandingCell: UITableViewCell {
  
  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var textView: UITextView!
  
  var editMode = false
  var delegate: ExpandingCellDelegate!
  
  var summary: String? {
    didSet {
      label.text = summary
      textView.text = summary
    }
  }
  
  class func nib() -> UINib {
    return UINib(nibName: "ExpandingCell", bundle: nil)
  }
  
  class func reuseIdentifier()->String{
    return "ExpandingCell"
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    contentView.autoresizingMask = .FlexibleHeight
    
    textView.hidden = !editMode
    
    textView.layer.borderColor = UIColor.blackColor().CGColor
    textView.layer.borderWidth = 1.0
    textView.layer.cornerRadius = 5.0
  }
  
  @IBAction func update(sender: AnyObject) {
    
    editMode = !editMode
    
    if editMode {
      textView.hidden = false
      label.hidden = true
      
      textView.becomeFirstResponder()
      
      NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveCursor", userInfo: nil, repeats: false)
    } else {
      textView.hidden = true
      label.hidden = false
      
      summary = textView.text
      delegate.updateSummary(summary!)
    }
  }
  
  func moveCursor() {
    textView.selectedRange = NSMakeRange(0, 0)
  }
  
  
}
