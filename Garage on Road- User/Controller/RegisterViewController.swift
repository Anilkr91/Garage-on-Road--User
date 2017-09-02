//
//  RegisterViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var mobileTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateOTP() {
        
        let param = GROTPModel(phone: mobileTextfield.text!).toJSON()
        GenerateOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
            print(otp)
        }
    }
}
