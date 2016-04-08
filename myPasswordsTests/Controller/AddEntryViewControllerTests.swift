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
    
    var sut = AddEntryViewController()

    override func setUp()
    {
        super.setUp()
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
    
    func test_HasLoginTextField()
    {

        XCTAssertNotNil(sut.loginTextField)
    }
    
    func test_HasPasswordTextField1()
    {

        XCTAssertNotNil(sut.passwordTextField1)
    }
    
    func test_HasPasswordTextField2()
    {

        XCTAssertNotNil(sut.passwordTextField2)
    }
    
    
    func test_HasURLTextField()
    {

        XCTAssertNotNil(sut.uRLTextField)
    }
    
    
    func test_HasRemarkTextField()
    {

        XCTAssertNotNil(sut.remarkTextField)
    }
    
    func test_HasCancelButtonWithTargetSelf()
    {
        XCTAssertNotNil(sut.navigationItem.leftBarButtonItem?.target === self)
    }
    
    func test_HasDoneButtonWithTargetSelf()
    {
        
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.target === self)
    }
    
    func test_cancelButtonDismissesViewController()
    {
        
    }
    
    
}

extension AddEntryViewControllerTests
{
    class MockAddEntryViewController:AddEntryViewController
    {
    //    dismissViewController()
        
    }
}
