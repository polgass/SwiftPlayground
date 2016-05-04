//
//  PeopleListDataProviderTests.swift
//  Birthdays
//
//  Created by Paul Sevilla on 04/05/2016.
//  Copyright © 2016 Dominik Hauser. All rights reserved.
//

import XCTest
import Birthdays
import CoreData

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
    
    // FAKES
    // 1
    managedObjectModel = NSManagedObjectModel.mergedModelFromBundles(nil)
    storeCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    
    do {
      store = try storeCoordinator.addPersistentStoreWithType(NSInMemoryStoreType,
                                                          configuration: nil, URL: nil, options: nil)
    } catch let error as NSError {
      print(error)
    }
    
    
    managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
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
    managedObjectContext = nil
    
    var error: NSError?
    do {
      try storeCoordinator.removePersistentStore(store)
    } catch let err as NSError {
      error = err
    }
    
    XCTAssert(error == nil, "couldn't remove persistent store: \(error)")
    
    super.tearDown()
  }
  
  func testThatStoreIsSetUp() {
    XCTAssertNotNil(store, "no persistent store")
  }
  
  func testOnePersonInThePersistantStoreResultsInOneRow() {
    dataProvider.addPerson(testRecord)
    
    XCTAssertEqual(tableView.dataSource!.tableView(tableView, numberOfRowsInSection: 0), 1,
                   "After adding one person number of rows is not 1")
  }
  
}
