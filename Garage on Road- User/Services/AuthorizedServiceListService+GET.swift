//
//  AuthorizedServiceListService+GET.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class AuthorizedServiceListGetService {
    static func executeRequest (params:[String: AnyObject],completionHandler: @escaping ([AuthorizedServiceListModel]) -> Void) {
        
        //let header: HTTPHeaders = ["X_API_KEY" : Constants.API_KEY]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "provider/authorised_list", method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { response in
            
            switch response.result {
            case .success(let value) :
                if let data = AuthorizedServiceListArray.init(json: value as! JSON)  {
                    completionHandler(data.results)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
