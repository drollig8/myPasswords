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
    
    var titleLabel: UILabel!
    var loginLabel: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 20))
        loginLabel = UILabel(frame: CGRect(x: 0, y: 20, width: frame.width, height: 20))
        
        // title
                self.titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 22))
        self.titleLabel.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)

        self.addSubview(titleLabel)
        self.addSubview(loginLabel)
        
        // title
                self.loginLabel = UILabel(frame: CGRect(x: 0, y: 23, width: 100, height: 22))
        self.loginLabel.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.5)

        self.addSubview(titleLabel)
        

    }
    

    
    func configCellWithEntry(entry: Entry)
    {
        titleLabel.text = entry.title
        loginLabel.text = entry.loginName
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

