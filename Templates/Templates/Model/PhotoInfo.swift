//
//  PhotoInfo.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 17/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import Foundation

final class PhotoInfo: NSObject, ResponseObjectSerializable, ResponseCollectionSerializable {
  let id: Int
  let url: String
  
  var name: String?
  
  var favoritesCount: Int?
  var votesCount: Int?
  var commentsCount: Int?
  
  var highest: Float?
  var pulse: Float?
  var views: Int?
  var camera: String?
  var desc: String?
  
  init(id: Int, url: String) {
    self.id = id
    self.url = url
  }
  
//  init(JSON: AnyObject) {
//    
//  }
  
  required init(response: NSHTTPURLResponse, representation: AnyObject) {
    self.id = representation.valueForKeyPath("photo.id") as! Int
    self.url = representation.valueForKeyPath("photo.image_url") as! String
    
    self.favoritesCount = representation.valueForKeyPath("photo.favorites_count") as? Int
    self.votesCount = representation.valueForKeyPath("photo.votes_count") as? Int
    self.commentsCount = representation.valueForKeyPath("photo.comments_count") as? Int
    self.highest = representation.valueForKeyPath("photo.highest_rating") as? Float
    self.pulse = representation.valueForKeyPath("photo.rating") as? Float
    self.views = representation.valueForKeyPath("photo.times_viewed") as? Int
    self.camera = representation.valueForKeyPath("photo.camera") as? String
    self.desc = representation.valueForKeyPath("photo.description") as? String
    self.name = representation.valueForKeyPath("photo.name") as? String
  }
  
  override func isEqual(object: AnyObject!) -> Bool {
    return (object as! PhotoInfo).id == self.id
  }
  
  override var hash: Int {
    return (self as PhotoInfo).id
  }
  
  static func collection(response response: NSHTTPURLResponse, representation: AnyObject) -> [PhotoInfo] {
    var photos = [PhotoInfo]()
    
    photos = (representation.valueForKeyPath("photos") as! [NSDictionary]).map({ dict in
      let photo = PhotoInfo(id: dict.valueForKey("id") as! Int, url: dict.valueForKey("url") as! String)
      photo.name = dict.valueForKey("name") as? String
      photo.pulse = dict.valueForKey("rating") as? Float
      
      return photo
    })
    
    return photos
  }
}