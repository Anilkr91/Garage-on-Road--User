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
        generateOTP()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func generateOTP() {
        let param = GROTP(phone: mobileTextfield.text!).toJSON()
        GenerateOTPPostService.userlogin(params: param! as [String : AnyObject]) { (otp) in
            print(otp)
            self.performSegue(withIdentifier: "VerifyOTPSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "VerifyOTPSegue" {
            
            let dvc = segue.destination as! VerifyViewController
            dvc.mobile = mobileTextfield.text
        }
    }
}
