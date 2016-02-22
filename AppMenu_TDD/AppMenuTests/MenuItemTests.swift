//
//  MenuItemTests.swift
//  AppMenu
//
//  Created by offshoreadmin on 22/02/2016.
//  Copyright © 2016 simplyhired. All rights reserved.
//

import XCTest

class MenuItemTests: XCTestCase {
    var menuItem: MenuItem?
    
    override func setUp() {
        super.setUp()
        menuItem = MenuItem(title: "Contributions")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatMenuItemHasATitle() {
        XCTAssertEqual(menuItem!.title, "Contributions",
            "A title should always be present")
    }
    
    func testThatMenuItemCanBeAssignedASubTitle() {
        menuItem!.subTitle = "Repos contributed to"
        XCTAssertEqual(menuItem!.subTitle!, "Repos contributed to",
            "Subtitle should be what we assigned")
    }
    
    func testThatMenuItemCanBeAssignedAnIconName() {
        menuItem!.iconName = "iconContributions"
        XCTAssertEqual(menuItem!.iconName!, "iconContributions",
            "Icon name should be what we assigned")
    }
}
