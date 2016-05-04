//
//  ViewController.swift
//  DayAndWeekCalendarView
//
//  Created by Peter Paul Sevilla on 17/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import Foundation
import UIKit

let DATE_COMPONENTS: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second, .Weekday, .WeekdayOrdinal]
let CURRENT_CALENDAR = NSCalendar.currentCalendar()

class ViewController: UIViewController, MADayViewDataSource, MADayViewDelegate {
  
  var eventKitDataSource: MAEventKitDataSource {
    return MAEventKitDataSource()
  }
  
  var event: MAEvent {
    return theEvent()
  }
  
  var date: NSDate!
  var counter = 0
  var flag = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let dayView = MADayView(frame: view.bounds)
    /* The default is not to autoscroll, so let's override the default here */
    dayView.autoScrollToFirstEvent = true
    dayView.dataSource = self
    dayView.delegate = self
    self.view = dayView
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func dayView(dayView: MADayView!, eventsForDate date: NSDate!) -> [AnyObject]! {
    self.date = date
    let arr = [event, event, event, event, event, event, event, event, event]
    
    var generateAllDayEvents = size_t()
    generateAllDayEvents++
    
    if generateAllDayEvents % 4 == 0 {
      arr[0].title = "All-day events test 1"
      arr[0].allDay = true
      
      arr[1].title = "All-day events test 2";
      arr[1].allDay = true
    }
    return arr
  }
  
  func theEvent() -> MAEvent {
    
    var dict = [String: NSString]()
    dict["test"] = "number \(counter++)"
    
    let r = Int(arc4random()) % 24;
    let rr = Int(arc4random()) % 3;
    
    flag = !flag
    print(flag)
    
    let event = MAEvent()
    event.backgroundColor = flag ? UIColor.purpleColor() : UIColor.brownColor();
    event.textColor = UIColor.whiteColor()
    event.allDay = false
    event.userInfo = dict
    
    if (rr == 0) {
      event.title = "Event lorem ipsum es dolor test. This a long text, which should clip the event view bounds."
    } else if (rr == 1) {
      event.title = "Foobar."
    } else {
      event.title = "Dolor test."
    }
    
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(DATE_COMPONENTS, fromDate: date)
    components.hour = r
    components.minute = 0
    components.second = 0
    
    event.start = CURRENT_CALENDAR.dateFromComponents(components)
    
    components.hour = r + rr
    components.second = 0
    
    event.end = CURRENT_CALENDAR.dateFromComponents(components)
    
    return event
  }
}



