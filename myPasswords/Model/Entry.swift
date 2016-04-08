//
//  Entry.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

struct Entry: Equatable
{
    var title: String
    let loginName: String?
    var password: String?
    var url: String?
    var remarks: String?
    
    
    private let titleKey = "titleKey"
    private let loginNameKey = "loginNameKey"
    private let passwordKey = "passwordKey"
    private let urlKey = "urlKey"
    private let remarksKey = "remarksKey"
    
    init(title: String, loginName: String? = nil, password: String? = nil, url: String? = nil, remarks: String? = nil)
    {
        
        self.title = title
        self.loginName = loginName
        self.password = password
        self.url = url
        self.remarks = remarks
    }
    
    var plistDict: NSDictionary
    {
        var dict = [String: AnyObject]()
        dict[titleKey] = title
        if let loginName = loginName {
            dict[loginNameKey] = loginName
        }
        if let password = password {
            dict[passwordKey] = password
        }
        if let url = url {
            dict[urlKey] = url
        }
        if let remarks = remarks {
            dict[remarksKey] = remarks
        }
        return dict
    }
    
    init?(dict: NSDictionary)
    {
        guard let title = dict[titleKey] as? String else {return nil}
        
        self.title = title
        
        self.loginName = dict[loginNameKey] as? String
        self.password = dict[passwordKey] as? String
        self.url = dict[urlKey] as? String
        self.remarks = dict[remarksKey] as? String
        
    }
}


func ==(lhs: Entry, rhs: Entry) -> Bool
{
    if lhs.loginName != rhs.loginName {
        return false
    }
    if lhs.password != rhs.password {
        return false
    }
    if lhs.title != rhs.title {
        return false
    }
    if lhs.url != rhs.url {
        return false
    }
    if lhs.remarks != rhs.remarks {
        return false
    }
    
    return true
}