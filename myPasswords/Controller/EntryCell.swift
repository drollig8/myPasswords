//
//  EntryCell.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class EntryCell: UITableViewCell
{
    var titleLabel: UILabel!
    var loginLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 20))
        loginLabel = UILabel(frame: CGRect(x: 0, y: 20, width: frame.width, height: 20))
        
        self.addSubview(titleLabel)
        self.addSubview(loginLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCellWithEntry(entry: Entry)
    {
        titleLabel.text = entry.title
        loginLabel.text = entry.loginName
    }
    
    
    
}
