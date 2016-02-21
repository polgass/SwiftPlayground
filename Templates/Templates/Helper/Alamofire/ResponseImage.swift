//
//  ResponseImage.swift
//  Templates
//
//  Created by Peter Paul Sevilla on 17/02/2016.
//  Copyright © 2016 Peter Paul Sevilla. All rights reserved.
//

import Foundation
import Alamofire

extension Alamofire.Request {
  public static func imageResponseSerializer() -> ResponseSerializer<UIImage, NSError> {
    return ResponseSerializer { request, response, data, error in
      
      guard let validData = data else {
        let failureReason = "Data could not be serialized. Input data was nil."
        let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
        return .Failure(error)
      }
      
      if let image = UIImage(data: validData, scale: UIScreen.mainScreen().scale) {
        return .Success(image)
      } else {
        return .Failure(Error.errorWithCode(.DataSerializationFailed, failureReason: "Unable to create image."))
      }
      
    }
  }
  
  func responseImage(completionHandler: Response<UIImage, NSError> -> Void) -> Self {
    return response(responseSerializer: Request.imageResponseSerializer(), completionHandler: completionHandler)
  }
}