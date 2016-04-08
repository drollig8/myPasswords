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
        if tableView == nil {
            tableView = UITableView(frame: self.view.frame, style: .Grouped)
        }
        self.view.addSubview(tableView)
        tableView.dataSource = dataprovider
        tableView.delegate = dataprovider
        print("-----------------------")
        print("TableView set in viewDidLoad: \(tableView)")
        print("-----------------------")
        tableView.registerClass(EntryCell.classForCoder(), forCellReuseIdentifier: "Cell")
        assert(dataprovider != nil)
        dataprovider.entryManager = entryManager
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(addEntry(_:)))

        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(showDetail(_:)), name: "EntrySelectedNotification", object: nil)
    }
    
    func addEntry(sender: AnyObject)
    {
        let addEntryViewController = AddEntryViewController()
        addEntryViewController.entryManager = entryManager
        presentViewController(addEntryViewController, animated: true, completion: nil)
        
    
    }

    func showDetail(sender:NSNotification)
    {
        let showDetailViewControll =  DetailViewController()
        navigationController?.pushViewController(showDetailViewControll, animated: true)
        
    }
}
