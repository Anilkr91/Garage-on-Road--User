//
//  GRError.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct GRError {

    let success: Bool
    let error: String
    let error_code: Int
    
    // MARK: - Deserialization
    
    init?(json: JSON) {
        print(json)
        guard let success: Bool = "success" <~~ json,
            let error: String = "error" <~~ json,
            let error_code: Int = "error_code" <~~ json else { return nil }
        
        self.success = success
        self.error = error
        self.error_code = error_code
    }
}
