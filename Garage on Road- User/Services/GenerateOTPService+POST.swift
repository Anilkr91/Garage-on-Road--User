//
//  GenerateOTPService+POST.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class GenerateOTPPostService {
    
    static func userlogin (params:[String: AnyObject] , completionHandler: @escaping (GRUser) -> Void) {
        
        //        let header: HTTPHeaders = ["Authorization" : "Buddy \(Default.getObject(key: "AuthAccessToken"))"]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "user/otp", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            switch response.result {
            case .success(let data):
                let user = GRUser(json: data as! JSON)
                if user?.device_token == nil {
                    let error = GRError(json: data as! JSON)
                    Alert.showAlertWithError(title: "Error", message: error!.error)
                } else {
                    print(data)
                    completionHandler(user!)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        debugPrint(request)
    }
}
