//
//  EntryListViewControllerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryListViewControllerTests: XCTestCase {
    
    var sut: EntryListViewController!
    override func setUp()
    {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewControllerWithIdentifier("EntryListViewController") as! EntryListViewController
        _ = sut.view
    }
    
    override func tearDown()
    {
        super.tearDown()
    }
    
    func test_TableViewNotNil()
    {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testViewDidLoad_SetsDatasource()
    {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func testViewDidLoad_SetsDelegate()
    {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func testSUT_HasAddBarButtonItemWithSelfAsTarget()
    {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.target)
        XCTAssertTrue(sut.navigationItem.rightBarButtonItem?.target === sut)
    }
    
    func testSUT_PresentsAddEntryViewController()
    {
        XCTAssertNil(sut.presentedViewController)
        guard let addButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        sut.performSelector(addButton.action, withObject: addButton)
        
        XCTAssertNotNil(sut.presentedViewController)
    }
    
    func testSUT_PutsEntryManagerAtAddEntryViewController()
    {
        XCTAssertNil(sut.presentedViewController)
        guard let addButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        sut.performSelector(addButton.action, withObject: addButton)
        
        guard let addEntryViewController = sut.presentedViewController as? AddEntryViewController else {fatalError()}
        
        XCTAssertTrue(addEntryViewController.entryManager === sut.entryManager)
    }
    
    func testSUT_SetsItemManagerToDataProvider()
    {
        XCTAssertTrue(sut.dataProvider.entryManager === sut.entryManager)
    }
    
    func testSelectedEntryNotification_PushesDetailViewController()
    {
        let mockNavigationController = MockNavigationController(rootViewController: sut)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        
        NSNotificationCenter.defaultCenter().postNotificationName("EntrySelectedNotification", object: nil, userInfo: ["index":1])
        
        XCTAssertTrue(mockNavigationController.pushedViewController is DetailViewController)
    }
}

extension EntryListViewControllerTests
{
    class MockNavigationController: UINavigationController
    {
        var pushedViewController : UIViewController!
        override func pushViewController(viewController: UIViewController, animated: Bool) {
            pushedViewController = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }
}

