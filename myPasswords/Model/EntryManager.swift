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
    
    private func getSectionLetters() -> [String]
    {
        var sections = Set<String>()
        for entry in entries {
            sections.insert(entry.title.firstLetterUpperCase)
        }

        let sortedSectionLetters = Array(sections).sort({$0 < $1})
        
        return sortedSectionLetters
    }
    
    func numberOfSections() -> Int
    {
        let sectionsLetters = getSectionLetters()
        
        return sectionsLetters.count
    }
    
    func entryCountForSection(section: Int) -> Int
    {
        let sectionLetters = getSectionLetters()
        guard sectionLetters.count > section else {return 0}
        let sectionLetter = sectionLetters[section]
        
        func getAllEntryThatBeginWithLetter(sectionLetter: String) -> [Entry] {
            var returnArray = [Entry]()
            for entry in entries {
                if entry.title.firstLetterUpperCase == sectionLetter {
                    returnArray.append(entry)
                }
            }
            return returnArray
        }
        let sectionsEntries = getAllEntryThatBeginWithLetter(sectionLetter)
        return sectionsEntries.count
    }
    
    func addEntry(entry: Entry)
    {
        if !entries.contains(entry) {
            entries.append(entry)
        }
    }
    
    // TODO ist falsch!!
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