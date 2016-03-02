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
    
    func testInit_ShouldSetLoginName()
    {
        let entry = Entry(loginName: "TestName")
        XCTAssertEqual(entry.loginName, "TestName","Initializer should set LoginName")
    }
    
    func testInit_ShouldSetLoginNameAndPassword()
    {
        let entry = Entry(loginName: "TestName", password: "Password")
        XCTAssertEqual(entry.password, "Password","Initializer should set LoginName")
    }
    
    func testInit_ShouldSetLoginNameAndPasswordAndTitle()
    {
        let entry = Entry(loginName: "TestName", password: "Password", title: "Titel")
        XCTAssertEqual(entry.title, "Titel","Initializer should set LoginName")
    }
    
    func testInit_ShouldSetLoginNameAndPasswordAndTitleAndUrl()
    {
        let entry = Entry(loginName: "TestName", password: "Password", title: "Titel", url: "Url")
        XCTAssertEqual(entry.url, "Url","Initializer should set LoginName")
    }
    
    func testInit_ShouldSetLoginNameAndPasswordAndTitleAndUrlRemarks()
    {
        let entry = Entry(loginName: "TestName", password: "Password", title: "Titel", url: "Url", remarks: "remarks")
        XCTAssertEqual(entry.remarks, "remarks","Initializer should set LoginName")
    }
    
    // H.T. = Honey Tits
    
}
/*

@NSManaged var url: String?
@NSManaged var remarks: String?
@NSManaged var section: String?
*/