//
//  LoginViewController.swift
//  XMPPSwift
//
//  Created by Paul Sevilla on 2/24/15.
//  Copyright (c) 2015 Paul Sevilla. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
  
  let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
  
  @IBOutlet weak var usernameTF: UITextField!
  @IBOutlet weak var passwordTF: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    usernameTF.text = "ppps@ejabberd.onvolo.com"
    passwordTF.text = "chatroom"
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func login(sender: AnyObject) {
    
    var defaults = NSUserDefaults.standardUserDefaults()
    let u = usernameTF.text as NSString
    let p = passwordTF.text as NSString
    
    if u.length > 0 && p.length > 0 {
      defaults.setValue(u, forKey: kXMPPmyJID)
      defaults.setValue(p, forKey: kXMPPmyPassword)
    }
    
    defaults.synchronize()
    
    if appDelegate.connect() {
      let hvc = storyboard?.instantiateViewControllerWithIdentifier("HomeVC") as ViewController
      presentViewController(hvc, animated: true, completion: nil)
    }
  }
}
