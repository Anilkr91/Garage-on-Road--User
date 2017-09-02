//
//  GRRegister.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct GRRegister {
    let name: String
    let email: String
    let address : String
    let phone: String
    let login_by: String
    let device_type: String
    let password: String
    let device_token: String
    
    init(name: String, email: String, address: String, phone: String, login_by: String, device_type: String, password: String, device_token: String) {
        self.name = name
        self.email = email
        self.address = address
        self.phone = phone
        self.login_by = login_by
        self.device_type = device_type
        self.password = password
        self.device_token = device_token
    }
    
    // MARK: - Deserialization
    
    func toJSON() -> JSON? {
        return jsonify([
        "name" ~~> self.name,
        "email" ~~> self.email,
        "address" ~~> self.address,
        "phone" ~~> self.phone,
        "login_by" ~~> self.login_by,
        "device_type" ~~> self.device_type,
        "password" ~~> self.password,
        "device_token" ~~> self.device_token,
        ])
    }
}
