//
//  Entry.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import Foundation

struct Entry
{
    let loginName: String
    var password: String?
    var title: String?
    var url: String?
    var remarks: String?
    
    init(loginName: String, password: String? = nil, title: String? = nil, url: String? = nil, remarks: String? = nil)
    {
        self.loginName = loginName
        self.password = password
        self.title = title
        self.url = url
        self.remarks = remarks
    }
}
