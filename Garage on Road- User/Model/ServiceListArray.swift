//
//  ServiceListArray.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct ServiceListArray {
    
    let results: [ServiceListModel]
    
    init?(json: JSON) {
        
        guard let results: [ServiceListModel] = "services" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "services" ~~> self.results
            ])
}
}
