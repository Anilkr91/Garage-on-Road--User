//
//  GROTPVerifyModel.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GROTPVerifyModel {
    
    let success: Bool
    let mobile: String
    
    
    init?(json: JSON) {
        guard let success: Bool = "success" <~~ json,
            let mobile: String = "mobile" <~~ json else { return nil }
        
        self.success = success
        self.mobile = mobile
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "mobile" ~~> self.mobile,
            "success" ~~> self.success
            ])
    }
}
