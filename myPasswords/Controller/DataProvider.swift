//
//  EntryListDataProvider.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit


let kEntrySelectedNotification = "EntrySelectedNotification"
class EntryListDataProvider: NSObject, UITableViewDataSource, UITableViewDelegate
{
    var entryManager: EntryManager!
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        let numberOfEntries = entryManager.entryCountForSection(section)
        print("number of entries: \(numberOfEntries)")
        return numberOfEntries
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EntryCell
        let entry = entryManager.entryAtIndexPath(indexPath)
        cell.configCellWithEntry(entry)
        return cell
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        let numberOfSections = entryManager.numberOfSections()
        return numberOfSections
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let x = ["indexPath":indexPath]
        print("Sending Notification: Number of sections: \(x)")    
        NSNotificationCenter.defaultCenter().postNotificationName(kEntrySelectedNotification, object: self, userInfo: ["indexPath":indexPath])
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return entryManager.headerForSection(section)
    }
    
}