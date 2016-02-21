//
//  ViewController.swift
//  CalendarPicker
//
//  Created by Peter Paul Sevilla on 18/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit
import EPCalendarPicker

class ViewController: UIViewController, EPCalendarPickerDelegate {

  @IBOutlet weak var label: UILabel!
  @IBOutlet weak var fromStackView: UIStackView!
  @IBOutlet weak var toStackView: UIStackView!
  @IBOutlet weak var datePickerHeight: NSLayoutConstraint!
  @IBOutlet weak var eventDateFromLabel: UILabel!
  @IBOutlet weak var eventDateToLabel: UILabel!
  @IBOutlet weak var eventTimeFromLabel: UILabel!
  @IBOutlet weak var eventTimeToLabel: UILabel!
  @IBOutlet weak var datePicker: UIDatePicker!
  @IBOutlet weak var box1: UIView!
  @IBOutlet weak var box2: UIView!
  @IBOutlet weak var box3: UIView!
  @IBOutlet weak var box4: UIView!
  
  enum EventDateField {
    case From, To
  }
  
  var datePickerOpen = false
  var eventDate: EventDateField!

  @IBAction func datePicked(sender: AnyObject) {
    let dp = sender as! UIDatePicker
    displayEventDate(dp, ed: eventDate!)
  }
  
  func displayEventDate(picker: UIDatePicker, ed: EventDateField) {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy h:mm a"
    let strDate = dateFormatter.stringFromDate(picker.date).lowercaseString
    let strArray = strDate.componentsSeparatedByString(" ")
    let dateStr = strArray.first
    let timeStr = strArray[1] + " " + strArray[2]
    
    switch ed {
    case .From:
      eventDateFromLabel.text = dateStr
      eventTimeFromLabel.text = timeStr
    case .To:
      eventDateToLabel.text = dateStr
      eventTimeToLabel.text = timeStr
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    datePickerHeight.constant = 0
    
    displayEventDate(datePicker, ed: .From)
    displayEventDate(datePicker, ed: .To)
    
    let fgr = UITapGestureRecognizer(target: self, action: "showDatePicker:")
    fgr.numberOfTapsRequired = 1
    fromStackView.addGestureRecognizer(fgr)
    
    let tgr = UITapGestureRecognizer(target: self, action: "showDatePicker:")
    tgr.numberOfTapsRequired = 1
    toStackView.addGestureRecognizer(tgr)
    
    box1.layer.borderColor = UIColor.grayColor().CGColor
    box1.layer.borderWidth = 1.0
    box2.layer.borderColor = UIColor.grayColor().CGColor
    box2.layer.borderWidth = 1.0
    box3.layer.borderColor = UIColor.grayColor().CGColor
    box3.layer.borderWidth = 1.0
    box4.layer.borderColor = UIColor.grayColor().CGColor
    box4.layer.borderWidth = 1.0
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func showCalendar(sender: UIButton) {
    
    let calendarPicker = EPCalendarPicker(startYear: 2015, endYear: 2017, multiSelection: true, selectedDates: nil)
    calendarPicker.multiSelectEnabled = false
    calendarPicker.calendarDelegate = self
    let navigationController = UINavigationController(rootViewController: calendarPicker)
    self.presentViewController(navigationController, animated: true, completion: nil)
    
  }
  
  func epCalendarPicker(_: EPCalendarPicker, didCancel error: NSError) {
    
  }
  
  func epCalendarPicker(_: EPCalendarPicker, didSelectDate date: NSDate) {
    
  }
  
  func showDatePicker(sender: UITapGestureRecognizer) {
    let tag = sender.view!.tag
    eventDate = tag == 1 ? .From : .To
    
    if !datePickerOpen {
      datePickerOpen = true
      datePickerHeight.constant = 216
    } else {
      datePickerOpen = false
      datePickerHeight.constant = 0
    }
  }

}

