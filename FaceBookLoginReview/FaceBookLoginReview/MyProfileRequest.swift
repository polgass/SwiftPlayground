//
//  MyProfileRequest.swift
//  FaceBookLoginReview
//
//  Created by Peter Paul Sevilla on 16/02/2017.
//  Copyright © 2017 Peter Paul Sevilla. All rights reserved.
//

import Foundation
import FacebookCore

struct MyProfileRequest: GraphRequestProtocol {
  
  struct Response: GraphResponseProtocol {
    var firstName: String?
    var lastName: String?
    var email: String?
    var photoUrl: String?
    
    init(rawResponse: Any?) {
      if let response = rawResponse,
        let dict = response as? [String: AnyObject] {
        firstName = dict["first_name"] as? String
        lastName = dict["last_name"] as? String
        email = dict["email"] as? String
        
        if let picture = dict["picture"] as? [String: AnyObject],
        let data = picture["data"] as? [String: AnyObject],
          let url = data["url"] as? String {
          photoUrl = url
        }
      }
    }
  }
  
  var graphPath = "/me"
  var parameters: [String : Any]? = ["fields": "first_name, last_name, email, picture"]
  var accessToken = AccessToken.current
  var httpMethod: GraphRequestHTTPMethod = .GET
  var apiVersion: GraphAPIVersion = .defaultVersion
}
