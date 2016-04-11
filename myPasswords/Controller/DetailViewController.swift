//
//  DetailViewController.swift
//  myPasswords
//
//  Created by Marc Felden on 02.03.16.
//  Copyright © 2016 madeTK.com. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    
    var entry: Entry!
    
    var titleTextField: UITextField!
    var loginTextField: UITextField!
    var passwordTextField1: UITextField!
    var passwordTextField2: UITextField!
    var uRLTextField: UITextField!
    var remarkTextField: UITextField!
    
    override func viewDidLoad() {
        
        
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
        
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(cancel))
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        
        assert(self.entry != nil)
        
        self.titleTextField.text = entry.title
        self.loginTextField.text = entry.loginName ?? ""
        self.passwordTextField1.text = entry.password ?? ""
        self.uRLTextField.text = entry.url ?? ""
        self.remarkTextField.text = entry.remarks ?? ""
        
    }
    
    func cancel()
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
