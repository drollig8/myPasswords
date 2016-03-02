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
    
    init(title: String, loginName: String? = nil, password: String? = nil, url: String? = nil, remarks: String? = nil)
    {
        
        self.title = title
        self.loginName = loginName
        self.password = password
        self.url = url
        self.remarks = remarks
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