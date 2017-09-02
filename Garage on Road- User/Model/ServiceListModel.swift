//
//  ServiceListModel.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss
struct ServiceListModel: Decodable {
    
    let id: Int
    let name: String
    
    
    init?(json: JSON) {
        guard let id: Int = "id" <~~ json,
            let name: String = "name" <~~ json else { return nil }
        
        self.id = id
        self.name = name
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "id" ~~> self.id,
            "name" ~~> self.name
            ])
    }
}
