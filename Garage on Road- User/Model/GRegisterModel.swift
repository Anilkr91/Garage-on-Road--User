//
//  GRegisterModel.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct GRegisterModel {
    
    let success: Bool
    let id: Int
    let first_name: String
    let phone: String
    let email: String
    let picture: String?
    let address : String
    let login_by: String?
    let referral_code: String
    let is_referee: Int
    let device_token: String
    let token: String
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        guard let success: Bool = "success" <~~ json,
            let id: Int  = "id" <~~ json,
            let first_name: String = "first_name" <~~ json,
            let phone: String = "phone" <~~ json,
            let email: String = "email" <~~ json,
//            let picture: String = "picture" <~~ json,
            let address: String = "address" <~~ json,
//            let login_by: String = ,
            let referral_code: String = "referral_code" <~~ json,
            let is_referee: Int = "is_referee" <~~ json,
            let device_token: String = "device_token" <~~ json,
            let token: String = "token" <~~ json else { return nil }
        
        self.address = address
        self.device_token = device_token
        self.email = email
        self.id = id
        self.first_name = first_name
        self.phone = phone
        self.picture = "picture" <~~ json
        self.success = success
        self.token = token
        self.login_by = "login_by" <~~ json
        self.referral_code = referral_code
        self.is_referee = is_referee
    }
}
