//
//  GRSucess.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/18/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GRSucess {
    
    let success: Bool
    let error: String
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        guard let success: Bool = "success" <~~ json,
            let error: String = "error" <~~ json else { return nil }
        
        self.success = success
        self.error = error
    }
}
