//
//  ViewController.swift
//  Dog Walk
//
//  Created by Pietro Rea on 7/10/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {
  
  @IBOutlet var tableView: UITableView!
  var walks:Array<NSDate> = []
  var managedContext: NSManagedObjectContext!
  var currentDog: Dog!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.registerClass(UITableViewCell.self,
      forCellReuseIdentifier: "Cell")
    
    let dogEntity = NSEntityDescription.entityForName("Dog", inManagedObjectContext: managedContext)
    let dog = Dog(entity: dogEntity!, insertIntoManagedObjectContext: managedContext) // may not be needed
    
    let dogName = "Fido"
    let dogFetch = NSFetchRequest(entityName: "Dog")
    dogFetch.predicate = NSPredicate(format: "name == %@", dogName)
    
    var error: NSError?
    
    let result = managedContext.executeFetchRequest(dogFetch, error: &error) as [Dog]?
    
    if let dogs = result {
      if dogs.count == 0 {
        currentDog = Dog(entity: dogEntity!, insertIntoManagedObjectContext: managedContext)
        currentDog.name = dogName
        
        if !managedContext.save(&error) {
          println("Could not save: \(error)")
        }
      } else {
        currentDog = dogs[0]
      }
    }
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      var numRows = 0
      if let dog = currentDog? {
        numRows = dog.walks.count
      }
    
      return numRows
  }
  
  func tableView(tableView: UITableView,
    titleForHeaderInSection section: Int) -> String? {
      return "List of Walks";
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateStyle = .ShortStyle
    dateFormatter.timeStyle = .MediumStyle
    
    let walk = currentDog.walks[indexPath.row] as Walk
    cell.textLabel!.text = dateFormatter.stringFromDate(walk.date)
    
    return cell
  }
  
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    return true
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == UITableViewCellEditingStyle.Delete {
      let walkToRemove = currentDog.walks[indexPath.row] as Walk
      managedContext.deleteObject(walkToRemove)
      var error: NSError?
      if !managedContext.save(&error) {
        println("Could not save: \(error)")
      }
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
  }
  
  @IBAction func add(sender: AnyObject) {
    let walkEntity = NSEntityDescription.entityForName("Walk", inManagedObjectContext: managedContext)
    let walk = Walk(entity: walkEntity!, insertIntoManagedObjectContext: managedContext)
    walk.date = NSDate()
    
    var walks = currentDog.walks.mutableCopy() as NSMutableOrderedSet
    walks.addObject(walk)
    currentDog.walks = walks.copy() as NSOrderedSet
    
    var error: NSError?
    if !managedContext.save(&error) {
      println("Could not save: \(error)")
    }
    
    tableView.reloadData()
  }
}

