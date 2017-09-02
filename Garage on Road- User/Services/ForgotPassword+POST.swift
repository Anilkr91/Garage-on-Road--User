//
//  ForgotPassword+POST.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/18/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Alamofire
import Gloss

class ForgotPasswordPostService {
    
    static func changePassword (params:[String: AnyObject] , completionHandler: @escaping (GRSucess) -> Void) {
        
        //        let header: HTTPHeaders = ["Authorization" : "Buddy \(Default.getObject(key: "AuthAccessToken"))"]
        let URL = Constants.BASE_URL
        let request = Alamofire.request( URL + "application/forgot-password", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            
            switch response.result {
            
            case .success(let data):
            let response = GRError(json: data as! JSON)
            
            if response?.error_code == nil {
             let data = GRSucess(json: data as! JSON)
                completionHandler(data!)
            } else {
                
                Alert.showAlertWithError(title: "Error", message: response!.error)
                }
                
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    debugPrint(request)
    }
}
