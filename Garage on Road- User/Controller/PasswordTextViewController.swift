//
//  PasswordTextViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/12/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit


class PasswordTextFieldViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func togglePassword(sender: AnyObject) {
        
        
        if passwordTextField.isSecureTextEntry == true {
            passwordTextField.isSecureTextEntry = false
        
            
        } else {
            passwordTextField.isSecureTextEntry = true
        }
        
    }
    
    
}
