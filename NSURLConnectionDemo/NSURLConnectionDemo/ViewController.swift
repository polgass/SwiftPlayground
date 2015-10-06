//
//  ViewController.swift
//  NSURLConnectionDemo
//
//  Created by Peter Paul Sevilla on 06/10/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDelegate {
  
  var responseData: NSMutableData!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let url = NSURL(string: "https://itunes.apple.com/search?term=apple&media=software")
    let request = NSURLRequest(URL: url!)
    let queue = NSOperationQueue()
    NSURLConnection.sendAsynchronousRequest(request, queue: queue) { (response, data, error) -> Void in
      do {
        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
        print(json)
      } catch {
        print("error in fetch")
      }
    }
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
}

