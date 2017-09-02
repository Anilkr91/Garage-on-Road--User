//
//  LoginTableViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class LoginTableViewController: UITableViewController {

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
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
        
        let phoneNumber = phoneTextField.text!
        let passwordNumber = passwordTextField.text!
       
        if phoneNumber.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "PhoneNumber is empty")
            
        } else if passwordNumber.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Password is empty")
        
        } else {
            let parameters = GRLoginModel(mobile: "8130703672", password: "myself90", device_token: "2y10e1DmYckhBD6bwfO9S4gVO6sJiNGRAqt3IpRjL5LL9VgMIlDCUhee", login_by: "manual").toJSON()
            loginUserService(params: parameters! as [String : AnyObject])
        }
    }
    
    @IBAction func createAccountTapped(_ sender: Any) {
        print("create Tapped")
    }

   
    @IBAction func forgotPasswordTapped(_ sender: Any) {
       Alert.showAlertWithAction(title: Constants.RESET_PASSWORD, message: Constants.RESET_PASSWORD_MESSAGE)
    }
}

extension LoginTableViewController {
    
    func loginUserService(params: [String : AnyObject]) {
        LoginPostService.userlogin(params: params, completionHandler: { (response) in
            print(response)
            let application = UIApplication.shared.delegate as! AppDelegate
            application.setHomeUserAsRVC()
            //self.gotoHome()
        })
    }
    func gotoHome() {
        performSegue(withIdentifier: "showHomeSegue", sender: self)
    }
}
