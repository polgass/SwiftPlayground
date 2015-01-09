//
//  UserTableViewCell.swift
//  MultipleStoryboards
//
//  Created by Paul Sevilla on 1/7/15.
//  Copyright (c) 2015 Onvolo. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

  @IBOutlet weak var profilePicture: UIImageView!
  @IBOutlet weak var name: UILabel!
  @IBOutlet weak var status: UILabel!
  @IBOutlet weak var datePosted: UILabel!
  
  var user: User? {
    didSet {
      configureCell()
    }
  }
  
  private func configureCell() {
    profilePicture.image = user?.avatarImage
    name.text = user?.name
    status.text = user?.status
    datePosted.text = user?.datePosted
    
    var url = NSURL(string: (user?.avatarFname)!)
    profilePicture.sd_setImageWithURL(url, placeholderImage: user?.avatarImage, options: SDWebImageOptions.RefreshCached)
  }
  
//  [imageView setImageWithURL:[NSURL URLWithString:@"https://graph.facebook.com/olivier.poitrey/picture"]
//  placeholderImage:[UIImage imageNamed:@"avatar-placeholder.png"]
//  options:SDWebImageRefreshCached];
}
