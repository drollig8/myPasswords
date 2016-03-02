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
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testNumberOfSections_IsNumberOfDifferentFirstLetter()
    {
        let sut = EntryListDataProvider()
        let tableView = UITableView()
        sut.entryManager = EntryManager()
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title"))
        let numberOfSections = sut.numberOfSectionsInTableView(tableView)
        
        XCTAssertEqual(numberOfSections, 2)
    }
    
    
    func testNumberOfRowsInFirstSections_IsNumberEntries()
    {
        let sut = EntryListDataProvider()
        let tableView = UITableView()
        sut.entryManager = EntryManager()
        sut.entryManager.addEntry(Entry(title: "A-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title"))
        sut.entryManager.addEntry(Entry(title: "B-Title1"))
        let numberOfSections0 = sut.tableView(tableView, numberOfRowsInSection: 0)
        let numberOfSections1 = sut.tableView(tableView, numberOfRowsInSection: 1)
        XCTAssertEqual(numberOfSections0, 1)
        XCTAssertEqual(numberOfSections1, 2)
    }

}


