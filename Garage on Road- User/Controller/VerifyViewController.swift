//
//  VerifyViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class VerifyViewController: UIViewController {

    @IBOutlet weak var otpTextField: UITextField!
    var mobile: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        verifyOTP()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func verifyOTP() {
        let param = GROTPVerfiy(phone: mobile, code: otpTextField.text, device_type: "iOS", login_by: "manual").toJSON()
        GenerateOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
            print(otp)
        }
    }
    
}
