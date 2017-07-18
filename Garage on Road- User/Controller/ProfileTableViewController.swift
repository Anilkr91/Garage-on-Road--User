//
//  ProfileTableViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/11/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class ProfileTableViewController: UITableViewController {
    
     @IBOutlet weak var menuButton: UIBarButtonItem!
   
    @IBOutlet weak var nameTextField: UITextField!
//        didSet {
//            if nameTextField != nil {
//                let placeholderText = "Tap here"
//                let placeholderString = NSAttributedString(string: placeholderText, attributes: [NSForegroundColorAttributeName: UIColor(white: 0.66, alpha: 1.0)])
//                nameTextField.attributedPlaceholder = placeholderString
//                nameTextField.textColor = UIColor.green.withAlphaComponent(0.8)
//            }
//        }
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButton.target = self
        menuButton.action = #selector(toggleSideMenuView)
        nameTextField.text = "Anil"
        emailTextField.text = "anilklal91@gmail.com"
        placeTextField.text = "Rohini"
        phoneTextField.text = "12345678"
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
