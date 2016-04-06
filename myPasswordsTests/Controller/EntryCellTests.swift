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
    
    
    
    func testConfigWithItem_SetsLabelText()
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! EntryCell
        cell.configCellWithEntry(Entry(title: "Test123", loginName: "mfelden", password: "willrein", url: "madeTK.com", remarks: "Dies ist ein Test"))
        XCTAssertEqual(cell.titleLabel.text, "Test123")
        XCTAssertEqual(cell.loginLabel.text, "mfelden")
        
    }
 
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
