//
//  GROTP.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GROTP {
    
    let phone: String

    init(phone: String) {
        self.phone = phone
    }
        
    func toJSON() -> JSON? {
        return jsonify([
            "phone" ~~> self.phone
            ])
    }
}
