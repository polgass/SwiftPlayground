//
//  ViewController.swift
//  NSURLSessionDemo
//
//  Created by Peter Paul Sevilla on 06/10/2015.
//  Copyright © 2015 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLSessionDelegate, NSURLSessionDownloadDelegate {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var progressView: UIProgressView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    /*
    // data task using shared session
    let session = NSURLSession.sharedSession()
    let dataTask = session.dataTaskWithURL(NSURL(string: "https://itunes.apple.com/search?term=apple&media=software")!) { (data, response, error) -> Void in
      do {
        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as! [String: AnyObject]
        print(json)
        let count = json["resultCount"]
        print("result count is \(count)")
      } catch let error as NSError {
        print("Error: \(error.localizedDescription)")
      }
    }
    dataTask.resume()
    */
    
    // download task
    let sessionConfiguration = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
    let downloadTask = session.downloadTaskWithURL(NSURL(string: "http://cdn.tutsplus.com/mobile/uploads/2013/12/sample.jpg")!)
    downloadTask.resume()
  }
  
  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didFinishDownloadingToURL location: NSURL) {
    let data = NSData(contentsOfURL: location)
    dispatch_async(dispatch_get_main_queue()) { [unowned self] () -> Void in
      self.progressView.hidden = true
      self.imageView.image = UIImage(data: data!)
    }
  }
  
  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didResumeAtOffset fileOffset: Int64, expectedTotalBytes: Int64) {
    
  }
  
  func URLSession(session: NSURLSession, downloadTask: NSURLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
    dispatch_async(dispatch_get_main_queue()) { [unowned self] () -> Void in
      self.progressView.progress = Float(progress)
    }
  }
  
}

