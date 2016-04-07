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
    @IBOutlet weak var dataprovider: EntryListDataProvider!
    
    var entryManager = EntryManager()
    
    override func viewDidLoad()
    {
    
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: .Grouped)
        tableView.dataSource        = dataprovider
        tableView.delegate          = dataprovider
        tableView.registerClass(EntryCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
        dataprovider.entryManager   = entryManager
        

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

/*  UITABLEVIEW PROGRAMMATICALLY
 
import UIKit

class ViewController1: UIViewController, UITableViewDelegate,UITableViewDataSource {
    var tableView: UITableView  =   UITableView()
    let animals : [String] = ["Dogs","Cats","Mice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: UIScreen.mainScreen().bounds, style: UITableViewStyle.Plain)
        tableView.delegate      =   self
        tableView.dataSource    =   self
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView)
        
        
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animals.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.textLabel!.text = animals [indexPath.row]
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print(animals[indexPath.row])
        
    }
}
 */