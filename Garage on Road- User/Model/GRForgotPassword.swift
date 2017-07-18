//
//  GRForgotPassword.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/18/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct GRForgotPassword {
    
    let mobile: String
    let type: String
    
    init(mobile: String, type: String) {
        
        self.mobile = mobile
        self.type = type
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "mobile" ~~> self.mobile,
            "type" ~~> self.type
            ])
    }
}
