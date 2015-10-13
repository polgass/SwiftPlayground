//
//  PeopleListDataProviderTests.swift
//  Birthdays
//
//  Created by Peter Paul Sevilla on 13/10/2015.
//  Copyright © 2015 Dominik Hauser. All rights reserved.
//
import Birthdays
import CoreData
import XCTest

class PeopleListDataProviderTests: XCTestCase {
  
  var storeCoordinator: NSPersistentStoreCoordinator!
  var managedObjectContext: NSManagedObjectContext!
  var managedObjectModel: NSManagedObjectModel!
  var store: NSPersistentStore!
  
  var dataProvider: PeopleListDataProvider!
  
  var tableView: UITableView!
  var testRecord: PersonInfo!
  
  override func setUp() {
    super.setUp()
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // 1
    managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
    storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    
    do {
      store = try storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType,
        configuration: nil, URL: nil, options: nil)
    } catch let error as NSError {
      print("error: \(error)")
    }
    
    
    managedObjectContext = NSManagedObjectContext()
    managedObjectContext.persistentStoreCoordinator = storeCoordinator
    
    // 2
    dataProvider = PeopleListDataProvider()
    dataProvider.managedObjectContext = managedObjectContext
    
    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PeopleListViewController") as! PeopleListViewController
    viewController.dataProvider = dataProvider
    
    tableView = viewController.tableView
    
    testRecord = PersonInfo(firstName: "TestFirstName", lastName: "TestLastName", birthday: NSDate())
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class
    
    super.tearDown()
  }
  
  
  
}
