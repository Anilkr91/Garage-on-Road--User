//
//  RegisterTableViewController.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class RegisterTableViewController: UITableViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmpasswordTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    var mobile: String?
    var isShowPassword : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let mobile = mobile {
            phoneTextField.text = mobile
        }
        self.isShowPassword = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPassword(_ sender: Any) {
        
        if(isShowPassword == true) {
            passwordTextField.isSecureTextEntry = false
            isShowPassword = false
        } else {
            passwordTextField.isSecureTextEntry = true
            isShowPassword = true
        }
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        print("login Tapped")
        
        self.navigationController?.popToRootViewController(animated: true)
        
        
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        print("create Tapped")
        
        let name = nameTextField.text!
        let email = emailTextField.text!
        let phoneNumber = phoneTextField.text!
        let passwordNumber = passwordTextField.text!
        let confirmpassword = confirmpasswordTextField.text!
        let address = addressTextField.text!
        
        if name.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Name cannot be empty")
            
        } else if email.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Email cannot be empty")
            
        }else if phoneNumber.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Phone cannot be empty")
            
        } else if passwordNumber.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Password cannot be empty")
            
        } else if confirmpassword.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Confirm Password cannot be empty")
            
        } else if address.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Address cannot be empty")
            
        } else {
            let parameters = GRRegister(name: name, email: email, address: address, phone: phoneNumber, login_by: "manual", device_type: "iOS", password: passwordNumber, device_token: "2y10e1DmYckhBD6bwfO9S4gVO6sJiNGRAqt3IpRjL5LL9VgMIlDCUhee").toJSON()
            registerUserService(params: parameters! as [String : AnyObject])
        }
    }
}

extension RegisterTableViewController {
    
    func registerUserService(params: [String : AnyObject]) {
        RegisterPostService.userlogin(params: params, completionHandler: { (response) in
            print(response)
            self.gotoReferral()
        })
    }
    
    func gotoReferral() {
        performSegue(withIdentifier: "showreferralsegue", sender: self)
    }
}
