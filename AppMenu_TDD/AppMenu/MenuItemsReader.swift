//
//  MenuItemsReader.swift
//  AppMenu
//
//  Created by offshoreadmin on 22/02/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import Foundation

protocol MenuItemsReader {
    func readMenuItems() -> ([[String : String]]?, NSError?)
}