//
//  EntryManager.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class EntryManager:NSObject
{

    private var entries = [Entry]()
    
    // to save we need
    
    var entryPathURL: NSURL
    {
        let fileURLs = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        guard let documentURL = fileURLs.first else { fatalError() }
        return documentURL.URLByAppendingPathComponent("entryList.plist")
    }
    
    var entriesCount:Int {
        return entries.count
    }
    
    override init()
    {
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(save), name: UIApplicationWillResignActiveNotification, object: nil)
        if let nsEntryItems = NSArray(contentsOfURL: entryPathURL) {
            for dict in nsEntryItems {
                if let entryItem = Entry(dict: dict as! NSDictionary) {
                    entries.append(entryItem)
                }
            }
        }
    }
    
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self)
        save()
    }
    
    func save()
    {
        var nsEntryItems = [AnyObject]()
        for entry in entries {
            nsEntryItems.append(entry.plistDict)
        }
        if nsEntryItems.count > 0 {
            (nsEntryItems as NSArray).writeToURL(entryPathURL, atomically: true)
        } else {
            do {
                try NSFileManager.defaultManager().removeItemAtURL(entryPathURL)
            } catch {
                print(error)
            }
        }
    
    }
    
    func removeAllItems()
    {
        entries.removeAll()
    }
    
    
    private func getSectionLetters() -> [String]
    {
        var sections = Set<String>()
        for entry in entries {
            sections.insert(entry.title.firstLetterUpperCase)
        }

        let sortedSectionLetters = Array(sections).sort({$0 < $1})
        print(sortedSectionLetters)
        return sortedSectionLetters
    }
    
    func numberOfSections() -> Int
    {
        let sectionsLetters = getSectionLetters()
        
        return sectionsLetters.count
    }
    
    func getAllEntryThatBeginWithLetter(sectionLetter: String) -> [Entry] {
        var returnArray = [Entry]()
        for entry in entries {
            if entry.title.firstLetterUpperCase == sectionLetter {
                returnArray.append(entry)
            }
        }
        return returnArray
    }
    func entryCountForSection(section: Int) -> Int
    {
        let sectionLetters = getSectionLetters()
        guard sectionLetters.count > section else {return 0}
        let sectionLetter = sectionLetters[section]
        

        let sectionsEntries = getAllEntryThatBeginWithLetter(sectionLetter)
        return sectionsEntries.count
    }
    
    func addEntry(entry: Entry)
    {
        if !entries.contains(entry) {
            entries.append(entry)
        }
    }
    
    func headerForSection(section: Int) -> String
    {
        let sectionLetters = getSectionLetters()
        let title = sectionLetters[section]
        return title
    }
    
    func entryAtIndexPath(indexPath: NSIndexPath) -> Entry
    {
       // var entries = [Entry]()
        var sections = [[Entry]]()
        
        let sectionLetters = getSectionLetters()
        
        for sectionLetter in sectionLetters {
            let entries = getAllEntryThatBeginWithLetter(sectionLetter)
            sections.append(entries)
        }
        
        let section = indexPath.section
        let row = indexPath.row
        if sections.count == 0 { return Entry(title: "Fake") }
        return sections[section][row]
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