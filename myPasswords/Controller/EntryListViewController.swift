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
        tableView = UITableView(frame: self.view.frame, style: .Grouped)
        self.view.addSubview(tableView)
        tableView.dataSource = dataprovider
        tableView.delegate = dataprovider
        tableView.registerClass(EntryCell.classForCoder(), forCellReuseIdentifier: "Cell")
        dataprovider.entryManager = entryManager
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addEntry(_:)))

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showDetail(_:)), name: "EntrySelectedNotification", object: nil)
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
        navigationController?.pushViewController(showDetailViewControll, animated: true)
        
    }
}
