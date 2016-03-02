//
//  EntryManager.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

class EntryManager
{

    private var entries = [Entry]()
    
    func numberOfSections() -> Int
    {
        var sections = Set<String>()
        for entry in entries {
            sections.insert(entry.title.firstLetterUpperCase)
        }
        return sections.count
    }
    
    func entryCountForSection(section: Int) -> Int
    {
        return entries.count
    }
    
    func addEntry(entry: Entry)
    {
        if !entries.contains(entry) {
            entries.append(entry)
        }
    }
    
    func headerForSection(section: Int) -> String
    {
        let title = entries[section].title
        return title.firstLetterUpperCase
    }
}


extension String {
    
    var firstLetterUpperCase: String
        {
        get {
            let stringUpper = self.uppercaseString
            let index = stringUpper.startIndex.advancedBy(0)
            return "\(stringUpper[index])"
        }
        
    }
    
}