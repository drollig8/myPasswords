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
        return entryManager.entryCountForSection(section)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return EntryCell()
    }
    

    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        let numberOfSections = entryManager.numberOfSections()
        return numberOfSections
    }
    
}