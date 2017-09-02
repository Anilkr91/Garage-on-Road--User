//
//  GRLogin.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GRLoginModel {
    
    let mobile: String?
    let password: String?
    let device_token: String?
    let login_by: String?
    
    init(mobile: String?, password: String?, device_token: String?, login_by: String?) {
        
        self.mobile = mobile
        self.password = password
        self.device_token = device_token
        self.login_by = login_by
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "mobile" ~~> self.mobile,
            "password" ~~> self.password,
            "device_token" ~~> self.device_token,
            "login_by" ~~> self.login_by
            
            ])
    }
}
