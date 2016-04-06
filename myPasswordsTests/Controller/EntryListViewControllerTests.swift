//
//  EntryListViewControllerTests.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import XCTest
@testable import myPasswords

class EntryListViewControllerTests: XCTestCase
{
    
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

    func testViewDidLoad_RegistersCellClass()
    {
        
    }
    
    func testSUT_HasAddEntryBarButtonWithTargetSelf()
    {
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.target)
        XCTAssertNotNil(sut.navigationItem.rightBarButtonItem?.target === self)
    }
    
    func test_AddEntry_PresentsAddEntryVC()
    {
        XCTAssertNil(sut.presentedViewController)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        guard let addButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        
        sut.performSelector(addButton.action, withObject: self)
        
        XCTAssertNotNil(sut.presentedViewController)
    }
    
    func test_AddEntryGetsEntryManagerSet()
    {
        XCTAssertNil(sut.presentedViewController)
        
        UIApplication.sharedApplication().keyWindow?.rootViewController = sut
        guard let addButton = sut.navigationItem.rightBarButtonItem else {fatalError()}
        
        sut.performSelector(addButton.action, withObject: self)
        
        XCTAssertNotNil(sut.presentedViewController)
        
        guard let addEntryVC = sut.presentedViewController as? AddEntryViewController else {fatalError()}
        
        XCTAssertTrue(addEntryVC.entryManager === sut.entryManager)
    }
    
    func testSUT_SetsEntryManagerToDataPRovider()
    {
        XCTAssertTrue(sut.entryManager === sut.dataprovider.entryManager)
    }
    
    func testEntrySelectedNotifcation_pushesDetailViewController()
    {
        let mockNC = mockNavigationcontroller(rootViewController: sut)
        UIApplication.sharedApplication().keyWindow?.rootViewController = mockNC
        
        NSNotificationCenter.defaultCenter().postNotificationName("EntrySelectedNotification", object: nil, userInfo: ["index":1])
        
        XCTAssertTrue(mockNC.pushedVC is DetailViewController)
    }


}


extension EntryListViewControllerTests
{
    class mockNavigationcontroller: UINavigationController
    {
        var pushedVC: UIViewController!
        override func pushViewController(viewController: UIViewController, animated: Bool) {
            pushedVC = viewController
            super.pushViewController(viewController, animated: animated)
        }
    }

}