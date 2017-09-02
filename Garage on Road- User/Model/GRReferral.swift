//
//  GRReferral.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GRReferral {
    
    let id: String
    let token: String
    let referral_code: String
    let is_skip: String
    
    init(id: String, token: String, referral_code: String, is_skip: String) {
        
        self.id = id
        self.token = token
        self.referral_code = referral_code
        self.is_skip = is_skip
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "token" ~~> self.token,
            "referral_code" ~~> self.referral_code,
            "is_skip" ~~> self.is_skip
        ])
    }
}
