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
    var loginTextField: UITextField!
    var passwordTextField1: UITextField!
    var passwordTextField2: UITextField!
    var uRLTextField: UITextField!
    var remarkTextField: UITextField!
    
    var entryManager: EntryManager?
    
    override func viewDidLoad()
    {
        let width = self.view.frame.width
        let height:CGFloat = 30
        
        titleTextField = UITextField(frame: CGRect(x: 10, y: 70, width: width-20, height: height))
        titleTextField.placeholder = "Titel"
        titleTextField.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(titleTextField)
        
        loginTextField = UITextField(frame: CGRect(x: 10, y: 120, width: width-20, height: height))
        loginTextField.placeholder = "Login"
        loginTextField.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(loginTextField)
        
        passwordTextField1 = UITextField(frame: CGRect(x: 10, y: 170, width: width-20, height: height))
        passwordTextField1.placeholder = "Password"
        passwordTextField1.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(passwordTextField1)
        
        passwordTextField2 = UITextField(frame: CGRect(x: 10, y: 220, width: width-20, height: height))
        passwordTextField2.placeholder = "Password"
        passwordTextField2.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(passwordTextField2)
        
        uRLTextField = UITextField(frame: CGRect(x: 10, y: 270, width: width-20, height: height))
        uRLTextField.placeholder = "URL"
        uRLTextField.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(uRLTextField)
        
        remarkTextField = UITextField(frame: CGRect(x: 10, y: 320, width: width-20, height: height))
        remarkTextField.placeholder = "Remarks"
        remarkTextField.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(remarkTextField)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(cancel))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(save))
        
        self.view.backgroundColor = UIColor.whiteColor()
    }
    
    func cancel()
    {
        self.dis
        
    }
    
    func save()
    {
        
    }
}
