//
//  Bowtie.swift
//  Bow Ties
//
//  Created by Paul Sevilla on 12/17/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Bowtie: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var isFavorite: NSNumber
    @NSManaged var rating: NSNumber
    @NSManaged var searchKey: String
    @NSManaged var timesWorn: NSNumber
    @NSManaged var lastWorn: NSDate
    @NSManaged var photoData: NSData
    @NSManaged var tintColor: AnyObject

}
