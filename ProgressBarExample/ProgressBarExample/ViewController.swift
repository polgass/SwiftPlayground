//
//  ViewController.swift
//  ProgressBarExample
//
//  Created by Paul Sevilla on 9/15/15.
//  Copyright (c) 2015 Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NSURLConnectionDataDelegate {

  @IBOutlet weak var progressView: UIProgressView!
  @IBOutlet weak var imageView: UIImageView!
  
  var connectionManager: NSURLConnection!
  var downloadedMutableData: NSMutableData!
  var urlResponse: NSURLResponse!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let transform = CGAffineTransformMakeScale(1.0, 5.0)
    progressView.transform = transform
    
    downloadedMutableData = NSMutableData()
    
    let urlRequest = NSURLRequest(URL: NSURL(string: "http://www.devfright.com/wp-content/uploads/2014/05/iPhone4Wallpaper.jpg")!)
    NSURLRequest(URL: NSURL(string: "http://www.devfright.com/wp-content/uploads/2014/05/iPhone4Wallpaper.jpg")!, cachePolicy: .ReloadIgnoringLocalCacheData, timeoutInterval: 60)
    
    connectionManager = NSURLConnection(request: urlRequest, delegate: self)
  }

  // MARK:- NSURLConnectionDataDelegate
  func connection(connection: NSURLConnection, didReceiveResponse response: NSURLResponse) {
    println("\(response.expectedContentLength)")
    urlResponse = response
  }

  func connection(connection: NSURLConnection, didReceiveData data: NSData) {
    downloadedMutableData.appendData(data)
    progressView.progress = ((Float(100.0) / Float(urlResponse.expectedContentLength)) * Float(downloadedMutableData.length)) / Float(100)
    if progressView.progress == 1 {
      progressView.hidden = true
    } else {
      progressView.hidden = false
    }
    println("progress: \((Float(100.0) / Float(urlResponse.expectedContentLength)) * Float(downloadedMutableData.length))")
  }
  
  func connectionDidFinishLoading(connection: NSURLConnection) {
    println("Finished.")
    imageView.image = UIImage(data: downloadedMutableData)
  }
}

