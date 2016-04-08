//
//  EntryListDataProvider.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class EntryListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var entryManager: EntryManager!
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let numberOfEntries = entryManager.entryCountForSection(section)
        return numberOfEntries
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EntryCell
    //    let entry = entryManager.entryAtIndexPath(indexPath)
        cell.configCellWithEntry(Entry(title: ""))
        return cell
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        let numberOfSections = entryManager.numberOfSections()
        return numberOfSections
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        NSNotificationCenter.defaultCenter().postNotificationName("EntrySelectedNotifcation", object: self, userInfo: ["index":indexPath.row])
    }
    
    
}