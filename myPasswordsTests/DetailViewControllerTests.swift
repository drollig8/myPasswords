//
//  DetailViewControllerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 10.04.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//


import XCTest
@testable import myPasswords

class DetailViewControllerTests: XCTestCase
{
    
    var sut: DetailViewController!
    override func setUp()
    {
        super.setUp()
        sut = DetailViewController()
        
        let entry = Entry(title: "Test123", loginName: "test123", password: "test123", url: "test123", remarks: "test123")
        sut.entry = entry
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
        let sut = MockDetailViewController()
        let entry = Entry(title: "Test123", loginName: "test123", password: "test123", url: "test123", remarks: "test123")
        sut.entry = entry
        _ = sut.view
        guard let cancelButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        sut.performSelector(cancelButton.action)
        XCTAssertTrue(sut.dismissGotCalled)
    }
    
    func testSettingEntry_SetsTextFields()
    {
        XCTAssertEqual(sut.titleTextField.text, "Test123")
        XCTAssertEqual(sut.loginTextField.text, "test123")
        XCTAssertEqual(sut.passwordTextField1.text, "test123")
        XCTAssertEqual(sut.uRLTextField.text, "test123")
        XCTAssertEqual(sut.remarkTextField.text, "test123")
        
        
        
        
    }
    
}



extension DetailViewControllerTests
{
    class MockDetailViewController:DetailViewController
    {
        var dismissGotCalled = false
        override func dismissViewControllerAnimated(flag: Bool, completion: (() -> Void)?) {
            dismissGotCalled = true
        }
        
        var newViewController: UIViewController?
        
        override func presentViewController(viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)?) {
            self.newViewController = viewControllerToPresent
        }
        
    }
}
