//
//  ViewController.swift
//  FaceBookLoginReview
//
//  Created by Peter Paul Sevilla on 16/02/2017.
//  Copyright © 2017 Peter Paul Sevilla. All rights reserved.
//

import UIKit
import FacebookLogin


class ViewController: UIViewController {
  
  override func viewDidLoad() {
    // Add a custom login button to your app
    let myLoginButton = UIButton(type: .custom)
    myLoginButton.backgroundColor = UIColor.darkGray
    myLoginButton.frame = CGRect(x: 0.0, y: 0.0, width: 180.0, height: 40.0)
    myLoginButton.center = view.center
    myLoginButton.setTitle("My Login Button", for: .normal)
    
    // Handle clicks on the button
    myLoginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
    
    // Add the button to the view
    view.addSubview(myLoginButton)
  }
  
  // Once the button is clicked, show the login dialog
  @objc func loginButtonClicked() {
    let loginManager = LoginManager()
    loginManager.logIn(readPermissions: [.publicProfile, .email], viewController: self) { [unowned self] loginResult in
      switch loginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login.")
      case .success(_, _, _):
        print("Logged in!")
        self.performSegue(withIdentifier: "LoginToProfile", sender: nil)
      }
    }
  }
  
  
  
}

