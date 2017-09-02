//
//  VerifyViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var otpTextField: UITextField!
    var mobile: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLabel.text = "We have send a sms with OTP: \(String(describing: mobile!))"
    }

    @IBAction func doneButtonTapped(_ sender: Any) {
        
        let otp = otpTextField.text!
        if otp.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "Field cannot be empty")
            
        } else {
            verifyOTP()
        }
    }
    
    @IBAction func resendButtonTapped(_ sender: Any) {
        
        if let mobile = mobile {
         
            let param = GROTP(phone: mobile).toJSON()
            GenerateOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
                print(otp)
                 Alert.showAlertWithError(title: "Success", message: "OTP sent successfully")
            }
        }
    }
    
    func verifyOTP() {
        let param = GROTPVerfiy(phone: mobile!, code: otpTextField.text, device_type: "iOS", login_by: "manual").toJSON()
        VerifyOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
            print(otp)
             self.performSegue(withIdentifier: "showRegisterSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRegisterSegue" {
            let dvc = segue.destination as! RegisterTableViewController
            dvc.mobile = mobile!
        }
    }
}
