//
//  GROTPModel.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GROTPModel {
    
    let success: Bool
    let phone: String
    
    
    init(phone: String) {
        self.phone = phone
    }
        
    init?(json: JSON) {
        guard let success: Bool = "success" <~~ json,
            let phone: String = "phone" <~~ json else { return nil }
        
        self.success = success
        self.phone = phone
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "phone" ~~> self.phone
            ])
    }
}
