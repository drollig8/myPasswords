//
//  EntryCellTests.swift
//  myPasswords
//
//  Created by Marc Felden on 03.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryCellTests: XCTestCase
{
    var tableView: UITableView!
    
    override func setUp()
    {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewControllerWithIdentifier("EntryListViewController") as! EntryListViewController
        _ = controller.view
        tableView = controller.tableView
        tableView.dataSource = FakeDataSource()
        
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    /*
    func testConfigureCell_SetsName() {
        cell.configureCellWithItem(Actor(name: "test333", state: "off", imageName: nil))
        XCTAssertEqual(cell.textLabel.text,"test333")
    }
 */
 
 
    
    /*
    func testSUT_HasTitleLabel()
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! EntryCell
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testSUT_HasLoginLabel()
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! EntryCell
        XCTAssertNotNil(cell.loginLabel)
    }
    
    func testConfigWithItem_SetsTitelLabelTexts() {


        
        let cell = tableView.dequeueReusableCellWithIdentifier(
            "Cell",
            forIndexPath: NSIndexPath(forRow: 0, inSection: 0)) as! EntryCell
     
        cell.config
        cell.configCellWithItem(ToDoItem(title: "First", itemDescription: nil, timestamp: 1456150025, location: Location(name: "Home")))
        XCTAssertEqual(cell.titleLabel.text, "First")
        XCTAssertEqual(cell.locationLabel.text, "Home")
        XCTAssertEqual(cell.dateLabel.text, "02/22/2016")
 
    }
 
 */
}

extension EntryCellTests
{
    class FakeDataSource: NSObject, UITableViewDataSource
    {
        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            return UITableViewCell() // we cast this later to EntryCell
        }
        
    }
}
