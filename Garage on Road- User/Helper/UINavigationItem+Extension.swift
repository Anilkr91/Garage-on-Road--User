//
//  UINavigation+Extension.swift
//  Garage on Road- User
//
//  Created by Anil Kumar on 7/16/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit
extension UINavigationItem {
    //Make the title 2 lines with a title and a subtitle
    func addTitleAndSubtitleToNavigationBar () {
        let textfield = UITextField(frame: CGRect(x: 10.0, y: 0.0, width: 50.0, height: 40.0))
//        textfield.font = UIFont.boldSystemFont(ofSize: 14.0)
//        label.numberOfLines = 2
//        textfield.text = "\(title)\n\(subtitle)"
        textfield.textColor = UIColor.black
        textfield.sizeToFit()
        textfield.textAlignment = NSTextAlignment.center
        self.titleView = textfield
    }
}

extension String {
    func removeAllSpaces () -> String {
         return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
