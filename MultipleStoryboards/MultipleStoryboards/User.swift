//
//  User.swift
//  MultipleStoryboards
//
//  Created by Paul Sevilla on 1/7/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import Foundation

class User {
  var name: String
  var status: String
  var datePosted: String
  var avatarFname: String
  var avatarImage: UIImage {
    return UIImage(named: "cartman.jpeg")!
  }
  
  init(name: String, status: String, datePosted: String, avatarFname: String) {
    self.name = name
    self.status = status
    self.datePosted = datePosted
    self.avatarFname = avatarFname
  }
  
  
//  [imageView setImageWithURL:[NSURL URLWithString:@"https://graph.facebook.com/olivier.poitrey/picture"]
//  placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
//  options:SDWebImageRefreshCached];
}