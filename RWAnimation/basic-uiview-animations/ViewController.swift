//
//  ViewController.swift
//  basic-uiview-animations
//
//  Created by Marin Todorov on 8/11/14.
//  Copyright (c) 2014 Razeware LLC. All rights reserved.
//

import UIKit
import QuartzCore

//
// Util delay function
//
func delay(seconds seconds: Double, completion:()->()) {
  let popTime = dispatch_time(DISPATCH_TIME_NOW, Int64( Double(NSEC_PER_SEC) * seconds ))
  
  dispatch_after(popTime, dispatch_get_main_queue()) {
    completion()
  }
}

class ViewController: UIViewController {
  
  // MARK: ui outlets
  
  @IBOutlet var loginButton: UIButton!
  @IBOutlet var heading: UILabel!
  @IBOutlet var username: UITextField!
  @IBOutlet var password: UITextField!
  
  @IBOutlet var cloud1: UIImageView!
  @IBOutlet var cloud2: UIImageView!
  @IBOutlet var cloud3: UIImageView!
  @IBOutlet var cloud4: UIImageView!
  
  // MARK: further ui
  
  let spinner = UIActivityIndicatorView(activityIndicatorStyle: .WhiteLarge)
  
  let status = UIImageView(image: UIImage(named: "banner"))
  let label = UILabel()
  let messages = ["Connecting ...", "Authorization ...", "Sending credentials ...", "Failed"]
  
  // MARK: view controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginButton.layer.cornerRadius = 8.0
    loginButton.layer.masksToBounds = true
    
    //add the button spinner
    spinner.frame = CGRect(x: -20, y: 6, width: 20, height: 20)
    spinner.startAnimating()
    spinner.alpha = 0.0
    loginButton.addSubview(spinner)
    
    //add the status banner
    status.hidden = true
    status.center = loginButton.center
    view.addSubview(status)
    
    //add the status label
    label.frame = CGRect(x: 0, y: 0, width: status.frame.size.width, height: status.frame.size.height)
    label.font = UIFont(name: "HelveticaNeue", size: 18.0)
    label.textColor = UIColor(red: 228.0/255.0, green: 98.0/255.0, blue: 0.0, alpha: 1.0)
    label.textAlignment = .Center
    status.addSubview(label)
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    heading.center.x -= view.frame.width
    username.center.x -= view.frame.width
    password.center.x -= view.frame.width
    
    loginButton.center.y += 30
    loginButton.alpha = 0
  }
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    UIView.animateWithDuration(0.5, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.heading.center.x += self.view.frame.width
      }, completion: nil)
    
    UIView.animateWithDuration(0.5, delay: 0.3, options: .CurveEaseOut, animations: { () -> Void in
      self.username.center.x += self.view.frame.width
      }, completion: nil)
    
    UIView.animateWithDuration(0.5, delay: 0.4, options: .CurveEaseOut, animations: { () -> Void in
      self.password.center.x += self.view.frame.width
      }, completion: nil)
    
    UIView.animateWithDuration(0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: [], animations: { () -> Void in
      self.loginButton.center.y -= 30
      self.loginButton.alpha = 1.0
      }, completion: nil)
  }
  
  @IBAction func login() {
    let b = loginButton.bounds
    UIView.animateWithDuration(1.5, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 20, options: [], animations: { () -> Void in
        self.loginButton.bounds = CGRect(x: b.origin.x - 20, y: b.origin.y, width: b.size.width + 80.0, height: b.size.height)
      }, completion: { _ in
        //
        self.showMessage(index: 0)
    })
    
    UIView.animateWithDuration(0.33, delay: 0.0, options: .CurveEaseOut, animations: { () -> Void in
      self.loginButton.center.y += 60
      self.spinner.alpha = 1.0
      self.spinner.center = CGPoint(x: 40, y: self.loginButton.frame.size.height / 2)
      self.loginButton.backgroundColor = UIColor(red: 0.85, green: 0.83, blue: 0.45, alpha: 1.0)
      }, completion: nil)
  }
  
  func showMessage(index i: Int) {
    UIView.animateWithDuration(0.33, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: [], animations: { () -> Void in
      
      self.status.center.x += self.view.frame.width
      
    }, completion: { _ in
        
      self.status.hidden = true
      self.status.center.x -= self.view.frame.width
      self.label.text = self.messages[i]
      
      UIView.transitionWithView(self.status, duration: 0.3, options: [.CurveEaseOut, .TransitionCurlDown], animations: {
        self.status.hidden = false
        }, completion: { _ in
          
          delay(seconds: 2.0, completion: { () -> () in
            if i < self.messages.count - 1 {
              self.showMessage(index: i + 1)
            }
          })
      })
      
    })
  }
}

