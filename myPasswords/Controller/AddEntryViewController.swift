//
//  AddEntryViewController.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit


class AddEntryViewController: UIViewController
{
    
    var titleTextField: UITextField!
    
    var entryManager: EntryManager?
    
    override func viewDidLoad()
    {
        
        self.view.backgroundColor = UIColor.greenColor()
        let width = self.view.frame.width
        let standardHeight:CGFloat = 30
        
        titleTextField = UITextField(frame: CGRect(x: 10, y: 10, width: width, height: standardHeight))
        
        self.view.addSubview(titleTextField)
        
        
    }
}
