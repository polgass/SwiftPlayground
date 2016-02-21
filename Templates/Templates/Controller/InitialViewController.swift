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
          print("\(i + 1): \(name) url: \(v.url)")
        }
      }
    }
  }
}
