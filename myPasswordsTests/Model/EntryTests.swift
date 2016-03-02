//
//  ItemTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryTests: XCTestCase {
    
    override func setUp()
    {
        super.setUp()
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func testInit_ShouldSetTitle()
    {
        let entry = Entry(title: "Titel")
        XCTAssertEqual(entry.title, "Titel","Initializer should set Title")
    }
    
    func testInit_ShouldSetTitleAndLoginName()
    {
        let entry = Entry(title: "Titel", loginName: "TestName")
        XCTAssertEqual(entry.loginName, "TestName","Initializer should set LoginName")
    }
    
    func testInit_ShouldSetTitleAndLoginNameAndPasswort()
    {
        let entry = Entry(title: "Titel", loginName: "TestName", password: "Password")
        XCTAssertEqual(entry.password, "Password","Initializer should set Password")
    }
    

    
    func testInit_ShouldSetTitleAndLoginNameAndPasswortAndUrl()
    {
        let entry = Entry(title: "Titel", loginName: "TestName", password: "Password", url: "url")
        XCTAssertEqual(entry.url, "url","Initializer should set url")
    }
    
    func testInit_ShouldSetTitleAndLoginNameAndPasswortAndUrlRemarks()
    {
        let entry = Entry(title: "Titel", loginName: "TestName", password: "Password", url: "url", remarks: "remarks")
        XCTAssertEqual(entry.remarks, "remarks","Initializer should set remarks")
    }
    
    // H.T. = Honey Tits
    
    func testThatTwoEqualEntries_AreEqual()
    {
        let firstEntry = Entry(title: "Titel", loginName: "TestName", password: "Password", url: "url", remarks: "remarks")
        let secondEntry = Entry(title: "Titel", loginName: "TestName", password: "Password", url: "url", remarks: "remarks")
        
        XCTAssertTrue(firstEntry == secondEntry)
    }
    
    func testThatTwoNotEqualEntries_AreNotEqual()
    {
        let firstEntry = Entry(title: "Titel", loginName: "TestName", password: "Password", url: "url", remarks: "remarks")
        let secondEntry = Entry(title: "TitelDifferent", loginName: "TestName", password: "Password", url: "url", remarks: "remarks")
        
        XCTAssertFalse(firstEntry == secondEntry)
    }

}
/*

@NSManaged var url: String?
@NSManaged var remarks: String?
@NSManaged var section: String?
*/