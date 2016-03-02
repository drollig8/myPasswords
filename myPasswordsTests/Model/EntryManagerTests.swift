//
//  EntryManagerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryManagerTests: XCTestCase {
    
    var sut: EntryManager!
    override func setUp()
    {
        super.setUp()
        sut = EntryManager()
        
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testEntryCountInSection0_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.toDoCount, 0,
            "Initially toDo count should be 0")
    }
    
    func testEntryCountInSection1_Initially_ShouldBeZero() {
        XCTAssertEqual(sut.doneCount, 0,
            "Initially done count should be 0")
    }
    
    func testEntryCountInSection0_AfterAddingOneItem_IsOne() {
        sut.addItem(ToDoItem(title: "Test title"))
        XCTAssertEqual(sut.toDoCount, 1, "toDoCount should be 1")
    }
    func testEntryCountInSection1_AfterAddingOneItem_IsOne() {
        sut.addItem(ToDoItem(title: "Test title"))
        XCTAssertEqual(sut.toDoCount, 1, "toDoCount should be 1")
    }
}



