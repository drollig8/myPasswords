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
        /* First implement EntryListViewController 
        let sut = EntryListDataProvider()
        sut.itemManager = EntryManager()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        controller = storyboard.instantiateViewControllerWithIdentifier("EntryListViewController") as! EntryListViewController
        
        _ = controller.view
        
        tableView = controller.tableView
        tableView.dataSource = sut
        tableView.delegate = sut
        
        sut.itemManager?.addItem(ToDoItem(title: "First"))
        
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 1)
        
        sut.itemManager?.addItem(ToDoItem(title: "Second"))
        tableView.reloadData()
        
        XCTAssertEqual(tableView.numberOfRowsInSection(0), 2)
        */
    }
}


