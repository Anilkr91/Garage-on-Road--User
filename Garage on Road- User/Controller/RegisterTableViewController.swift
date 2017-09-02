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
    var isShowPassword : Bool!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        //        let phoneNumber = phoneTextField.text!
        //        let passwordNumber = passwordTextField.text!
        //
        //        if phoneNumber.removeAllSpaces().isEmpty {
        //            print("phoneNumber is empty")
        //        } else if passwordNumber.removeAllSpaces().isEmpty {
        //            print("passwordNumber is empty")
        //        } else {
        //            let parameters = GRLoginModel(mobile: "8130703672", password: "myself90", device_token: "2y10e1DmYckhBD6bwfO9S4gVO6sJiNGRAqt3IpRjL5LL9VgMIlDCUhee", login_by: "manual").toJSON()
        //            loginUserService(params: parameters! as [String : AnyObject])
        //        }
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        print("create Tapped")
    }
    
    
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        Alert.showAlertWithAction(title: Constants.RESET_PASSWORD, message: Constants.RESET_PASSWORD_MESSAGE)
    }
}

extension RegisterTableViewController {
    
    func loginUserService(params: [String : AnyObject]) {
        LoginPostService.userlogin(params: params, completionHandler: { (response) in
            print(response)
            self.gotoHome()
        })
    }
    func gotoHome() {
        performSegue(withIdentifier: "showHomeSegue", sender: self)
    }
}
