//
//  ReferralViewController.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class ReferralViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func skipButtonTapped(_ sender: Any) {
        
        performSegue(withIdentifier: "", sender: self)
    }
    
    
    @IBAction func submitButtonTapped(_ sender: Any) {

        let param = GRReferral(id: "", token: "", referral_code: "", is_skip: "").toJSON()
        
        ReferralPostService.userlogin(params: param as! [String : AnyObject]) { (data) in
            print(data)
        }
    }
}
