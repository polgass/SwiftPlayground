//
//  WeekViewController.swift
//  DayAndWeekCalendarView
//
//  Created by Peter Paul Sevilla on 21/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController, MAWeekViewDataSource, MAWeekViewDelegate {
  
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
    
    let weekView = MAWeekView(frame: view.bounds)
    /* The default is not to autoscroll, so let's override the default here */
    weekView.dataSource = self
    weekView.delegate = self
    self.view = weekView
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func theEvent() -> MAEvent {
    
    var dict = [String: NSString]()
    dict["test"] = "number \(counter++)"
    
    let event = MAEvent()
    event.backgroundColor = UIColor.purpleColor()
    event.textColor = UIColor.whiteColor()
    event.allDay = false
    event.userInfo = dict
    return event
  }

  func weekView(weekView: MAWeekView!, eventsForDate date: NSDate!) -> [AnyObject]! {
    counter--
    
    let r = Int(arc4random()) % 24;
    let r2 = Int(arc4random()) % 10;
    
   var arr = NSArray()
    
    if (counter < 0) {
      arr = NSArray(array: [event])
    } else {
      arr = r <= 5 ? NSArray(array: [event, event]) : NSArray(array: [event, event])
      
      (arr.objectAtIndex(1) as! MAEvent).title = "All-day events test";
      (arr.objectAtIndex(1) as! MAEvent).allDay = true
      
      if (r > 5) {
        (arr.objectAtIndex(1) as! MAEvent).title = "Foo!";
        (arr.objectAtIndex(1) as! MAEvent).backgroundColor = UIColor.brownColor()
        (arr.objectAtIndex(1) as! MAEvent).allDay = true
      }
    }
    
    (arr.objectAtIndex(0) as! MAEvent).title = "Event lorem ipsum es dolor test";
    
    //
    let calendar = NSCalendar.currentCalendar()
    let components = calendar.components(DATE_COMPONENTS, fromDate: date)
    components.hour = r
    components.minute = 0
    
    (arr.objectAtIndex(0) as! MAEvent).start = CURRENT_CALENDAR.dateFromComponents(components)
    
    components.hour = r+1
    components.minute = 0
    
    (arr.objectAtIndex(0) as! MAEvent).end = CURRENT_CALENDAR.dateFromComponents(components)
    
    if (r2 > 5) {
      (arr.objectAtIndex(0) as! MAEvent).backgroundColor = UIColor.brownColor()
    }
    
    return arr as! [MAEvent]
  }
  
  
}
