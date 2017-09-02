//
//  OTPViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {
    
    @IBOutlet weak var mobileTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        let phoneNumber = mobileTextfield.text!
        if phoneNumber.removeAllSpaces().isEmpty {
            Alert.showAlertWithError(title: "Error", message: "phoneNumber is empty")
        
        } else {
            generateOTP()
        }
    }
    
    func generateOTP() {
        let param = GROTP(phone: mobileTextfield.text!).toJSON()
        GenerateOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
            print(otp)
            self.performSegue(withIdentifier: "showOTPSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showOTPSegue" {
            let dvc = segue.destination as! VerifyViewController
            dvc.mobile = mobileTextfield.text
        }
    }
}
