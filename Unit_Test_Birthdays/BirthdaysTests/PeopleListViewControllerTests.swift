//
//  PeopleListViewControllerTests.swift
//  Birthdays
//
//  Created by Paul Sevilla on 04/05/2016.
//  Copyright © 2016 Dominik Hauser. All rights reserved.
//
import UIKit
import XCTest
import Birthdays
import CoreData
import AddressBookUI

class PeopleListViewControllerTests: XCTestCase {
  
  var viewController: PeopleListViewController!
  
  override func setUp() {
    super.setUp()
    
    viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("PeopleListViewController") as! PeopleListViewController
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testDataProviderHasTableViewPropertySetAfterLoading() {
    // given
    let mockDataProvider = MockDataProvider()
    viewController.dataProvider = mockDataProvider
    
    // when
    XCTAssertNil(mockDataProvider.tableView, "Before loading the table view should be nil")
    let _ = viewController.view
    
    // then
    XCTAssertTrue(mockDataProvider.tableView != nil, "The table view should be set")
    XCTAssert(mockDataProvider.tableView == viewController.tableView, "The table view should be set to the table view of the data source")
  }
  
  func testCallsAddPersonOfThePeopleDataSourceAfterAddingAPersion() {
    // given
    let mockDataSource = MockDataProvider()
    viewController.dataProvider = mockDataSource
    
    // when
    let record: ABRecord = ABPersonCreate().takeRetainedValue()
    ABRecordSetValue(record, kABPersonFirstNameProperty, "TestFirstname", nil)
    ABRecordSetValue(record, kABPersonLastNameProperty, "TestLastname", nil)
    ABRecordSetValue(record, kABPersonBirthdayProperty, NSDate(), nil)
    
    viewController.peoplePickerNavigationController(ABPeoplePickerNavigationController(),
                                                    didSelectPerson: record)
    
    // then
    XCTAssert(mockDataSource.addPersonGotCalled, "addPerson should have been called")
  }
  
  func testSortingCanBeChanged() {
    // given
    let mockUserDefaults = MockUserDefaults(suiteName: "testing")!
    viewController.userDefaults = mockUserDefaults
    
    // when
    let segmentedControl = UISegmentedControl()
    segmentedControl.selectedSegmentIndex = 0
    segmentedControl.addTarget(viewController, action: "changeSorting:", forControlEvents: .ValueChanged)
    segmentedControl.sendActionsForControlEvents(.ValueChanged)
    
    // then
    XCTAssertTrue(mockUserDefaults.sortWasChanged, "Sort value in user defaults should be altered")
  }
  
  // MOCKS
  class MockDataProvider: NSObject, PeopleListDataProviderProtocol {
    var managedObjectContext: NSManagedObjectContext?
    var addPersonGotCalled = false
    weak var tableView: UITableView!
    
    func addPerson(personInfo: PersonInfo) { addPersonGotCalled = true }
    func fetch() { }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { return 1 }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      return UITableViewCell()
    }
  }
  
  class MockUserDefaults: NSUserDefaults {
    var sortWasChanged = false
    override func setInteger(value: Int, forKey defaultName: String) {
      if defaultName == "sort" {
        sortWasChanged = true
      }
    }
  }
  
  // STUBS
  // 1
  class MockAPICommunicator: APICommunicatorProtocol {
    var allPersonInfo = [PersonInfo]()
    var postPersonGotCalled = false
    
    // 2
    func getPeople() -> (NSError?, [PersonInfo]?) {
      return (nil, allPersonInfo)
    }
    
    // 3
    func postPerson(personInfo: PersonInfo) -> NSError? {
      postPersonGotCalled = true
      return nil
    }
  }
  
  func testFetchingPeopleFromAPICallsAddPeople() {
    // given
    // 1
    let mockDataProvider = MockDataProvider()
    viewController.dataProvider = mockDataProvider
    
    // 2
    let mockCommunicator = MockAPICommunicator()
    mockCommunicator.allPersonInfo = [PersonInfo(firstName: "firstname", lastName: "lastname",
      birthday: NSDate())]
    viewController.communicator = mockCommunicator
    
    // when
    viewController.fetchPeopleFromAPI()
    
    // then
    // 3
    XCTAssert(mockDataProvider.addPersonGotCalled, "addPerson should have been called")
  }

}
