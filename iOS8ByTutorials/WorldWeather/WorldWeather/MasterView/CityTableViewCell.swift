//
//  CityTableViewCell.swift
//  WorldWeather
//
//  Created by Paul Sevilla on 1/6/15.
//  Copyright (c) 2015 RayWenderlich. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
  // MARK: - IBoutlets
  @IBOutlet weak var cityImageView: UIImageView!
  @IBOutlet weak var cityNameLabel: UILabel!
  
  // MARK: - Properties
  var cityWeather: CityWeather? {
    didSet {
      configureCell()
    }
  }
  
  // MARK: Utility Methods
  private func configureCell() {
    cityImageView.image = cityWeather?.cityImage
    cityNameLabel.text = cityWeather?.name
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
