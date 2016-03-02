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
    @IBOutlet var dataProvider: EntryListDataProvider!
    
    var entryManager = EntryManager()
    
    override func viewDidLoad()
    {
        tableView.dataSource = dataProvider
        tableView.delegate = dataProvider
        dataProvider.entryManager = entryManager
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "showDetails:", name: "EntrySelectedNotification", object: nil)
    }
    @IBAction func addEntry(sender: AnyObject)
    {
        let addEntryViewController = storyboard?.instantiateViewControllerWithIdentifier("AddEntryViewController") as! AddEntryViewController
        addEntryViewController.entryManager = entryManager
        presentViewController(addEntryViewController, animated: true, completion: nil)
    }
    
    func showDetails(sender: NSNotification)
    {
        guard let index = sender.userInfo?["index"] as? Int else {fatalError()}
        
        if let detailViewController = storyboard?.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController {
            
            //detailViewController.index = index
            navigationController?.pushViewController(detailViewController, animated: true)
        }
    }
}
