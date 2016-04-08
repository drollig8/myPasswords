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
    var cell: EntryCell!
    
    override func setUp()
    {
        super.setUp()
        cell = EntryCell()
        
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
        XCTAssertNotNil(cell.titleLabel)
    }
    
    func testSUT_HasLoginLabel()
    {

        XCTAssertNotNil(cell.loginLabel)
    }
    
    
    
    func testConfigWithItem_SetsLabelText()
    {

        cell.configCellWithEntry(Entry(title: "Test123", loginName: "mfelden", password: "willrein", url: "madeTK.com", remarks: "Dies ist ein Test"))
        XCTAssertEqual(cell.titleLabel.text, "Test123")
        XCTAssertEqual(cell.loginLabel.text, "mfelden")
        
    }
 
}
