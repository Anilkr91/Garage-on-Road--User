//
//  AlertView+Helper.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/17/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
import Gloss

class Alert {
    
  
    static func showAlertWithError(title: String ,message:String) {
        let alertView = UIApplication.shared.windows[0].rootViewController
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {(action: UIAlertAction!) in
        }))
        alertView!.present(alert, animated: true, completion: nil)
    }
    
    static func showAlertWithAction(title: String ,message:String) {
        
        let alertView = UIApplication.shared.windows[0].rootViewController
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let resetAction = UIAlertAction(title: Constants.RESET, style: .default) { (action) in
            
            if let field = alert.textFields![0] as UITextField? {
                
                if field.text!.isEmpty {
                     Alert.showAlertWithError(title: "Error", message: "cannot be empty")
                } else {
                    let params = GRForgotPassword(mobile: field.text!, type: "2").toJSON() as! [String: AnyObject]
                    ForgotPasswordPostService.changePassword(params: params, completionHandler: { (response) in
                        Alert.showAlertWithError(title: "", message: response.error)
                    })
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: Constants.CANCEL, style: .cancel) { (action) in }
        
        alert.addTextField { (textField) in
            textField.keyboardType = .numberPad
            textField.placeholder = Constants.PLACEHOLDER_PASSWORD
        }
        
        alert.addAction(resetAction)
        alert.addAction(cancelAction)
        alertView!.present(alert, animated: true, completion: nil)
    }
}
