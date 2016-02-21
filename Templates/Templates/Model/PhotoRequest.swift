//
//  PhotoRequest.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 17/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import Foundation
import Alamofire

class PhotoRequest {
  // single object
  class func getPhoto(photoID id: Int, size: Five100px.ImageSize, completion: (photo: PhotoInfo?, error: NSError?) -> ()) -> Request? {
    return Alamofire.request(Five100px.Router.PhotoInfo(id, size)).validate().responseObject() { (response: Response<PhotoInfo, NSError>) -> Void in
      
      switch response.result {
      case .Success(let photoInfo):
        // save to disk here
        completion(photo: photoInfo, error: nil)
      case .Failure(let error):
        completion(photo: nil, error: error)
      }
    }
  }
  // collection
  class func getPhotos(page page: Int, completion: (results: [PhotoInfo]?, error: NSError?) -> ()) {
    Alamofire.request(Five100px.Router.PopularPhotos(1)).validate().responseCollection() {
      (response: Response<[PhotoInfo], NSError>) -> Void in
      
      switch response.result {
      case .Success(let photos):
        // save to disk here
        completion(results: photos, error: nil)
      case .Failure(let error):
        completion(results: nil, error: error)
      }
    }
  }
}
