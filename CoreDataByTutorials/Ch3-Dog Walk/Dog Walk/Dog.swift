//
//  Dog.swift
//  Dog Walk
//
//  Created by Paul Sevilla on 12/18/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import Foundation
import CoreData

class Dog: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var walks: NSOrderedSet

}
