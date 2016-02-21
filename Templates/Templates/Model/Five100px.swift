//
//  Five100px.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 17/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import Foundation
import Alamofire

struct Five100px {
  
  enum Router: URLRequestConvertible {
    static let baseURLString = "https://api.500px.com/v1"
    static let consumerKey = "gxOmf2cGljTn3ppkSlY0lYeIZUYWUjsqpbJG8sz4"
    
    case PopularPhotos(Int)
    case PhotoInfo(Int, ImageSize)
    case Comments(Int, Int)
    
    var URLRequest: NSMutableURLRequest {
      let result: (path: String, parameters: [String: AnyObject]) = {
        switch self {
        case .PopularPhotos (let page):
          let params = ["consumer_key": Router.consumerKey, "page": "\(page)", "feature": "popular", "rpp": "50",  "include_store": "store_download", "include_states": "votes"]
          return ("/photos", params)
        case .PhotoInfo(let photoID, let imageSize):
          let params = ["consumer_key": Router.consumerKey, "image_size": "\(imageSize.rawValue)"]
          return ("/photos/\(photoID)", params)
        case .Comments(let photoID, let commentsPage):
          let params = ["consumer_key": Router.consumerKey, "comments": "1", "comments_page": "\(commentsPage)"]
          return ("/photos/\(photoID)/comments", params)
        }
      }()
      
      let URL = NSURL(string: Router.baseURLString)
      let URLRequest = NSURLRequest(URL: URL!.URLByAppendingPathComponent(result.path))
      let encoding = Alamofire.ParameterEncoding.URL
      
      return encoding.encode(URLRequest, parameters: result.parameters).0
    }
  }
  
  enum ImageSize: Int {
    case Tiny = 1
    case Small = 2
    case Medium = 3
    case Large = 4
    case XLarge = 5
  }
}
