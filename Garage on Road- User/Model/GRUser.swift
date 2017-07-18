//
//  GRUser.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct GRUser {
    let address : String
    let device_token: String
    let email: String
    let id: Int
    let name: String
    let phone: String
    let picture: String
    let success: Bool
    let token: String
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        guard let address: String = "address" <~~ json,
            let device_token: String = "device_token" <~~ json,
            let email: String = "email" <~~ json,
            let id: Int  = "id" <~~ json,
            let name: String = "name" <~~ json,
            let phone: String = "phone" <~~ json,
            let picture: String = "picture" <~~ json,
            let success: Bool = "success" <~~ json,
            let token: String = "token" <~~ json else { return nil }
        
        self.address = address
        self.device_token = device_token
        self.email = email
        self.id = id
        self.name = name
        self.phone = phone
        self.picture = picture
        self.success = success
        self.token = token
    }
}
