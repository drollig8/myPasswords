//
//  AddEntryViewControllerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 08.04.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//


import XCTest
@testable import myPasswords

class AddEntryViewControllerTests: XCTestCase
{
    
    var sut: AddEntryViewController!
    override func setUp()
    {
        super.setUp()
        sut = AddEntryViewController()
        _ = sut.view
        
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func test_HasTitleTextField()
    {
        XCTAssertNotNil(sut.titleTextField)
    }
}
