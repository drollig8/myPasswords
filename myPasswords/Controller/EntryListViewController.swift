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

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var dataprovider: EntryListDataProvider!
    
    var entryManager = EntryManager()
    override func viewDidLoad()
    {
        tableView.dataSource = dataprovider
        tableView.delegate = dataprovider
        dataprovider.entryManager = entryManager

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showDetail:", name: "EntrySelectedNotification", object: nil)
    }
    
    @IBAction func addEntry(sender: AnyObject)
    {
        if let addEntryViewController = storyboard?.instantiateViewControllerWithIdentifier("AddEntryViewController") as? AddEntryViewController {
            addEntryViewController.entryManager = entryManager
            presentViewController(addEntryViewController, animated: true, completion: nil)
        }
    }


    func showDetail(sender:NSNotification)
    {
        if let showDetailViewControll = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController {
            navigationController?.pushViewController(showDetailViewControll, animated: true)
        }
    }
}
