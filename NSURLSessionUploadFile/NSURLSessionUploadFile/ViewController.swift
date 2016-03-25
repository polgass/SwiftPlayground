//
//  ViewController.swift
//  NSURLSessionUploadFile
//
//  Created by Peter Paul Sevilla on 25/03/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    myImageUploadRequest()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func myImageUploadRequest()
  {
    
    let myUrl = NSURL(string: "http://www.simplyhired.com/account/api/user/resume/upload/");
    
    let request = NSMutableURLRequest(URL:myUrl!);
    request.HTTPMethod = "POST";
    
    let param = [String: String]()
    
    let boundary = generateBoundaryString()
    
    request.setValue("Bearer 3CCDdigFU2Y6NLxM8N5Vqo4t7SmpNd", forHTTPHeaderField: "Authorization")
    request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
    
    let path = NSBundle.mainBundle().pathForResource("cv_psevilla", ofType: "pdf")
    let fileURL = NSURL(fileURLWithPath: path!)
    
    let imageData = NSData(contentsOfURL: fileURL)
    
    if(imageData==nil)  { return; }
    
    request.HTTPBody = createBodyWithParameters(param, filePathKey: "resume_file", imageDataKey: imageData!, boundary: boundary)
    
    
    
    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
      data, response, error in
      
      if error != nil {
        print("error=\(error)")
        return
      }
      
      // You can print out response object
      print("******* response = \(response)")
      
      // Print out reponse body
      let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
      print("****** response data = \(responseString!)")

      do {
        let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
        
        if let json = json {
          print(json)
        }
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
    
    task.resume()
    
  }
  
  
  func createBodyWithParameters(parameters: [String: String]?, filePathKey: String?, imageDataKey: NSData, boundary: String) -> NSData {
    let body = NSMutableData();
    
    if parameters != nil {
      for (key, value) in parameters! {
        body.appendString("--\(boundary)\r\n")
        body.appendString("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n")
        body.appendString("\(value)\r\n")
      }
    }
    
    let filename = "cv_psevilla.pdf"
    
    let mimetype = "application/pdf"
    
    body.appendString("--\(boundary)\r\n")
    body.appendString("Content-Disposition: form-data; name=\"\(filePathKey!)\"; filename=\"\(filename)\"\r\n")
    body.appendString("Content-Type: \(mimetype)\r\n\r\n")
    body.appendData(imageDataKey)
    body.appendString("\r\n")
    
    
    
    body.appendString("--\(boundary)--\r\n")
    
    return body
  }
  
  
  
  
  func generateBoundaryString() -> String {
    return "Boundary-\(NSUUID().UUIDString)"
  }
  
  
  
}



extension NSMutableData {
  
  func appendString(string: String) {
    let data = string.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: true)
    appendData(data!)
  }
}
