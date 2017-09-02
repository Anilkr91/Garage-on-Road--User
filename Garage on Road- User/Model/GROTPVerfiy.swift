//
//  GROTPVerfiyModel.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GROTPVerfiy {
    
    let phone: String?
    let code: String?
    let device_type: String?
    let login_by: String?
    
    init(phone: String?, code: String?, device_type: String?, login_by: String?) {
        
        self.phone = phone
        self.code = code
        self.device_type = device_type
        self.login_by = login_by
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "phone" ~~> self.phone,
            "code" ~~> self.code,
            "device_type" ~~> self.device_type,
            "login_by" ~~> self.login_by
            
            ])
    }
}
