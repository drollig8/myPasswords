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
    var tableView: UITableView!
    override func setUp()
    {
        super.setUp()
        sut = EntryListDataProvider()
        tableView = UITableView()
        tableView.dataSource = sut
        sut.entryManager = EntryManager()
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
    
    func testCellForRow_DequeuesCell() {
        
  //      let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        
     /*   sut.itemManager?.addItem(ToDoItem(title: "First"))
        mockTableView.reloadData()
        
        _ = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0))
        
        XCTAssertTrue(mockTableView.cellGotDequeued)
*/
    }
    /*
    func testConfigCell_GetsCalledInCellForRow() {
        
        let mockTableView = MockTableView.mockTableViewWithDataSource(sut)
        
        let toDoItem = ToDoItem(title: "First",
            itemDescription: "First description")
        sut.itemManager?.addItem(toDoItem)
        mockTableView.reloadData()
        
        let cell = mockTableView.cellForRowAtIndexPath(NSIndexPath(forRow: 0,
            inSection: 0)) as! MockItemCell
        
        XCTAssertEqual(cell.toDoItem, toDoItem)
    }
*/


}

extension EntryListDataProviderTests
{
    class MockTableView:UITableView
    {
        
        override func numberOfRowsInSection(section: Int) -> Int {
            return 1
        }
        
        override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
            return UITableViewCell()
        }
    }
}

