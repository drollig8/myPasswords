//
//  EntryManagerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryManagerTests: XCTestCase
{
    
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
    
    // MARK: - Number of Sections
    
    func testZeroEntry_ReturnZeroSections()
    {
        XCTAssertEqual(sut.numberOfSections(), 0, "Entry cound after adding should be 1")
    }
    
    func testOneEntry_ReturnOneSections()
    {
        sut.addEntry(Entry(title: "Title"))
        XCTAssertEqual(sut.numberOfSections(), 1, "Entry cound after adding should be 1")
    }
    
    func testTwoSameFirstLetterEntries_ReturnOneSections()
    {
        sut.addEntry(Entry(title: "Title"))
        sut.addEntry(Entry(title: "Title1"))
        XCTAssertEqual(sut.entryCountForSection(0),2)
        XCTAssertEqual(sut.numberOfSections(), 1, "Entry cound after adding should be 1")
    }
    
    func testTwoDifferentFirstLetterEntries_ReturnTwoSections()
    {
        sut.addEntry(Entry(title: "A-Title"))
        sut.addEntry(Entry(title: "B-Title"))
        XCTAssertEqual(sut.numberOfSections(), 2, "Entry cound after adding should be 1")
    }
    
    // MARK: - Number of Items in Section
    
    func testEntryCountInSection0_Initially_ShouldBeZero()
    {
        XCTAssertEqual(sut.entryCountForSection(0), 0, "Initially count should be 0")
    }
    
    func testEntryCountInSection1_Initially_ShouldBeZero()
    {
        XCTAssertEqual(sut.entryCountForSection(1), 0, "Initially count should be 0")
    }
    
    func testEntryCountInSection0_AfterAddingOneItem_IsOne()
    {
        sut.addEntry(Entry(title: "Title"))
        XCTAssertEqual(sut.entryCountForSection(0), 1, "Entry cound after adding should be 1")
    }
    
    func testEntryCountInSection0_AfterAddingTwoSameFirstletterItems_IsTwo()
    {
        sut.addEntry(Entry(title: "Title"))
        sut.addEntry(Entry(title: "Title1"))
        XCTAssertEqual(sut.entryCountForSection(0), 2, "Entry cound after adding should be 1")
    }
    
    func testNumberOfItemsInTwoSections()
    {
        sut.addEntry(Entry(title: "A-Title"))
        sut.addEntry(Entry(title: "B-Title"))
        sut.addEntry(Entry(title: "B-Title1"))
        XCTAssertEqual(sut.entryCountForSection(0), 1, "Entry cound after adding should be 1")
        XCTAssertEqual(sut.entryCountForSection(1), 2, "Entry cound after adding should be 1")
    }
    
    // MARK : - Other Stuff
    
    func testSUT_ReturnsSectionHeader()
    {
        sut.addEntry(Entry(title: "Title"))
        XCTAssertEqual(sut.headerForSection(0), "T")
    }
    
    func testTwoSameEntries_CannotBeAdded()
    {
        sut.addEntry(Entry(title: "Title"))
        sut.addEntry(Entry(title: "Title"))
        XCTAssertEqual(sut.entryCountForSection(0), 1, "Entry cound after adding should be 1")
    }
    
    func testSUT_ReturnsEntryAtIndexPath()
    {
        let entry1 = Entry(title: "A-Title")
        let entry2 = Entry(title: "B-Title")
        let entry3 = Entry(title: "B-Title1")
        sut.addEntry(entry1)
        sut.addEntry(entry2)
        sut.addEntry(entry3)
  
        print(sut.entryAtIndexPath(NSIndexPath(forRow: 0, inSection: 1)))
        
        XCTAssertEqual(sut.entryAtIndexPath(NSIndexPath(forRow: 0, inSection: 0)), entry1)
        XCTAssertEqual(sut.entryAtIndexPath(NSIndexPath(forRow: 0, inSection: 1)), entry2)
        XCTAssertEqual(sut.entryAtIndexPath(NSIndexPath(forRow: 1, inSection: 1)), entry3)

        
    }
    
    // MARK: - remove Item



}



