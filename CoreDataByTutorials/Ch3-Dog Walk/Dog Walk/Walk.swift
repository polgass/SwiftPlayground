//
//  Walk.swift
//  Dog Walk
//
//  Created by Paul Sevilla on 12/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Walk: NSManagedObject {

    @NSManaged var date: NSDate
    @NSManaged var dog: Dog

}
