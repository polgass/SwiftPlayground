//
//  InitialViewController.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 17/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import UIKit
import Alamofire

class InitialViewController: UIViewController {
  
  override func viewDidLoad() {
    
    
    /*
    let id = 140553595
    PhotoRequest.getPhoto(photoID: id, size: .Large) { (photo, error) -> () in
      guard let photo = photo else { return }
      print("Photo name: \(photo.name)")
      print("Photo url: \(photo.url)")
      print("Photo description: \(photo.desc)")
    }

    let page = 1
    PhotoRequest.getPhotos(page: page) { (results, error) -> () in
      if let results = results {
        for (i, v) in results.enumerate() {
          let name = v.name ?? "no name"
          print("\(i + 1): \(name) url: \(v.url) rating: \(v.pulse!)")
        }
      }
    }
    */
    let str = "was,  NC "
    
    
    let myString = "  \t\t  Let's trim all the whitespace  \n \t  \n  "
    print("TRIMMED: \(myString.customURLEncodedString())")
    print("ENCODED: \(myString.trimmedString().customURLEncodedString())")
  }
  
  func urlEncodedString(string: String) -> String {
    let newCharset = NSCharacterSet.URLQueryAllowedCharacterSet().mutableCopy() as! NSMutableCharacterSet
    newCharset.removeCharactersInString(",")
    newCharset.addCharactersInString("+")
    return string.stringByAddingPercentEncodingWithAllowedCharacters(newCharset)!
  }
}

extension String {
  func customURLEncodedString() -> String {
    let string = self.stringByReplacingOccurrencesOfString(" ", withString: "+")
    let newCharset = NSCharacterSet.URLQueryAllowedCharacterSet().mutableCopy() as! NSMutableCharacterSet
    newCharset.removeCharactersInString(",")
    newCharset.addCharactersInString("+")
    return string.stringByAddingPercentEncodingWithAllowedCharacters(newCharset)!
  }
  
  func trimmedString() -> String {
    return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
  }
}
