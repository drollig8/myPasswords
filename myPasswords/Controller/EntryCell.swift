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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    func configCellWithEntry(entry: Entry)
    {
        titleLabel.text = entry.title
        loginLabel.text = entry.loginName
    }
    
}
