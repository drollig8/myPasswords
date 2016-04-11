//
//  EntryListViewController.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class EntryListViewController: UIViewController
{

    var tableView: UITableView!
    var dataprovider: EntryListDataProvider!
    var entryManager = EntryManager()
    
    override func viewDidLoad()
    {
        let frame = CGRect(x: 0, y: 60, width: self.view.frame.width, height: self.view.frame.height - 60)
        tableView = UITableView(frame: frame, style: .Grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = dataprovider
        tableView.delegate = dataprovider
        tableView.registerClass(EntryCell.classForCoder(), forCellReuseIdentifier: "Cell")
        dataprovider.entryManager = entryManager
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addEntry(_:)))

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showDetail(_:)), name: kEntrySelectedNotification, object: nil)
        
    }
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        setTitle()
    }
    
    func setTitle()
    {
        self.title = ""
        if entryManager.entriesCount > 0 {
            self.title = "\(self.entryManager.entriesCount)"
        }
        
    }
    func addEntry(sender: AnyObject)
    {
        let addEntryViewController = AddEntryViewController()
        addEntryViewController.entryManager = entryManager
        
        let navigationController = UINavigationController(rootViewController: addEntryViewController)
        presentViewController(navigationController, animated: true, completion: nil)
        
    
    }

    func showDetail(sender:NSNotification)
    {
        let showDetailViewControll =  DetailViewController()
        if let userInfo = sender.userInfo {
            print(userInfo["indexPath"])
            if let indexPath = userInfo["indexPath"] as? NSIndexPath {
                print(entryManager.entriesCount)
                showDetailViewControll.entry = entryManager.entryAtIndexPath(indexPath)
                navigationController?.pushViewController(showDetailViewControll, animated: true)
            } else {
                fatalError("indexPatherror")
            } 
            
        }
       //
        
        
    }
}
