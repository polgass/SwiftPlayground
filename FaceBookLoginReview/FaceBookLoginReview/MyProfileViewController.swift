//
//  MyProfileViewController.swift
//  FaceBookLoginReview
//
//  Created by Peter Paul Sevilla on 16/02/2017.
//  Copyright © 2017 Peter Paul Sevilla. All rights reserved.
//

import UIKit
import FacebookCore

class MyProfileViewController: UIViewController {
  @IBOutlet weak var firstnameLabel: UILabel!
  @IBOutlet weak var lastnameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var pictureImageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let connection = GraphRequestConnection()
    connection.add(MyProfileRequest()) { response, result in
      switch result {
      case .success(let response):
        print("Custom Graph Request Succeeded: \(response)")
//        print("My facebook id is \(response.dictionaryValue?["id"])")
//        print("My name is \(response.dictionaryValue?["name"])")
        self.firstnameLabel.text = response.firstName!
        self.lastnameLabel.text = response.lastName!
        self.emailLabel.text = response.email!
        
        if let url = URL(string: response.photoUrl!) {
          DispatchQueue.global().async {
            let data = try? Data(contentsOf: url) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
            DispatchQueue.main.async {
              self.pictureImageView.image = UIImage(data: data!)
            }
          }
        }
        
      case .failed(let error):
        print("Custom Graph Request Failed: \(error)")
      }
    }
    connection.start()
  }
  
  func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
    URLSession.shared.dataTask(with: url) {
      (data, response, error) in
      completion(data, response, error)
      }.resume()
  }
  
  
}
