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
        let sut = MockAddEntryViewController()
        _ = sut.view
        guard let cancelButton = sut.navigationItem.leftBarButtonItem else {fatalError()}
        sut.performSelector(cancelButton.action)
        XCTAssertTrue(sut.dismissGotCalled)
    }
    
    func test_saveButtonSavesEntry()
    {
        sut.entryManager = EntryManager()
        XCTAssertEqual(sut.entryManager!.entriesCount, 0)
        guard let doneButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        sut.performSelector(doneButton.action)
        XCTAssertEqual(sut.entryManager!.entriesCount, 1)

    }
    
    func test_saveButtonDismissesViewController()
    {
        let sut = MockAddEntryViewController()
        _ = sut.view
        guard let doneButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        sut.performSelector(doneButton.action)
        XCTAssertTrue(sut.dismissGotCalled)
    }
    
    func test_AlertIfTwoPasswordsDontMatch()
    {
        // muss man mocken und 
        sut.passwordTextField1.text = "123"
        sut.passwordTextField2.text = "234"
        guard let doneButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        sut.performSelector(doneButton.action)
        print(sut.presentedViewController)
   //     XCTAssertTrue(sut.presentedViewController is UIAlertController)
        
    }
    
}

extension AddEntryViewControllerTests
{
    class MockAddEntryViewController:AddEntryViewController
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


