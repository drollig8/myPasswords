//
//  EntryListDataProviderTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryListDataProviderTests: XCTestCase {
    
    var sut: EntryListDataProvider!
    var controller: EntryListViewController!
    var tableView: UITableView!
    override func setUp()
    {
        super.setUp()
        
        sut = EntryListDataProvider()
        sut.entryManager = EntryManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewControllerWithIdentifier("EntryListViewController") as! EntryListViewController
        _ = controller.view
        tableView = controller.tableView
        assert(tableView != nil)
        tableView.dataSource = sut
       
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testNumberOfSections_IsNumberOfDifferentFirstLetter()
    {

        
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title"))
        let numberOfSections = sut.numberOfSectionsInTableView(tableView)
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    
    func testNumberOfRowsInFirstSections_IsNumberEntries()
    {
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title1"))
        let numberOfSections0 = sut.tableView(tableView, numberOfRowsInSection: 0)
        let numberOfSections1 = sut.tableView(tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(numberOfSections0, 1)
        XCTAssertEqual(numberOfSections1, 2)
    }
    
    func testCellForRow_ReturnsItemCell() {
        
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        tableView.reloadData()
        
       
       let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0))
        XCTAssertTrue(cell is EntryCell)
    }
    
    func testCellForRow_DequeuesCell()
    {
        
        let mockTableView = MockTableView(frame: CGRect(x: 0, y: 0, width: 100, height: 200), style: .Plain)
        
        mockTableView.dataSource = sut
        
        mockTableView.registerClass(EntryCell.self, forCellReuseIdentifier: "Cell")
      
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        
        mockTableView.reloadData()
        
        let _ = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0))

        XCTAssertTrue(mockTableView.cellGotDequeued)
    }
    
    
    
    func testConfigCell_GetsCalledInCellForRow() {
        
        let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        mockTableView.registerClass(MockItemCell.self, forCellReuseIdentifier: "Cell")
        let entry = Entry(title: "A-Title")
        sut.entryManager?.addEntry(entry)
        mockTableView.reloadData()
        let cell = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0)) as! MockItemCell
        XCTAssertEqual(cell.entryItem, entry)
    }
    

    func testSelectingACell_SendsNotifcation()
    {
        sut.entryManager.addEntry(Entry(title: "test"))
        
        
        expectationForNotification(kEntrySelectedNotification, object: nil) { (notification) -> Bool in
            guard let index = notification.userInfo?["indexPath"] as? NSIndexPath else {fatalError()}
            return index.row == 0
        }
        tableView.delegate?.tableView!(tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        waitForExpectationsWithTimeout(3, handler: nil)
    }

    func testTitleGetsSet()
    {
        sut.entryManager.addEntry(Entry(title: "test"	))
        let title = tableView.dataSource?.tableView!(tableView, titleForHeaderInSection: 0)
        XCTAssertEqual(title, "T")
    }

}


extension EntryListDataProviderTests
{
    class MockTableView:UITableView
    {
        var cellGotDequeued = false
        
        override func dequeueReusableCellWithIdentifier(identifier: String, forIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            cellGotDequeued = true
            return super.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
        }
        class func mockTableViewWithDataSource(
            dataSource: UITableViewDataSource) -> MockTableView {
            
            let mockTableView = MockTableView(
                frame: CGRect(x: 0, y: 0, width: 320, height: 480),
                style: .Plain)
            
            mockTableView.dataSource = dataSource
            mockTableView.registerClass(MockItemCell.self,
                                        forCellReuseIdentifier: "ItemCell")
            
            return mockTableView
        }

    }
    
    class MockTableViewCell: EntryCell
    {
        var configCellGotCalled = false
        var entry : Entry!
        override func configCellWithEntry(entry: Entry)
        {
            self.entry = entry
            configCellGotCalled = true
        }
        
        
    }
    
    class MockItemCell : EntryCell {
        
        var entryItem: Entry?
        

        override func configCellWithEntry(entry: Entry)
        {
            entryItem = entry
        }
    }
}

