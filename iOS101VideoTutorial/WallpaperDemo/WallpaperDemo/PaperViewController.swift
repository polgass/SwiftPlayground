//
//  PaperViewController.swift
//  WallpaperDemo
//
//  Created by Brian Moakley on 11/20/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class PaperViewController: UIViewController {
  
  var monthToShow: Int?
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  override func viewWillAppear(animated: Bool) {
    let imageName = String(format: "%02d.jpg", arguments: [monthToShow!])
    imageView.image = UIImage(named: imageName)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
