//
//  AuthorizedServiceListArray.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Gloss

struct AuthorizedServiceListArray {
    
    let results: [AuthorizedServiceListModel]
    
    init?(json: JSON) {
        
        guard let results: [AuthorizedServiceListModel] = "list" <~~ json else {
            return nil
        }
        self.results = results
    }
    
    func toJSON() -> JSON? {
        return jsonify([
            "list" ~~> self.results
            ])
    }
}
