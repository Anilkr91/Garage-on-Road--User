//
//  SideMenu.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/4/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Foundation
import UIKit

class SideMenu {
    fileprivate (set) var items = [Item]()
    
    class Item {
        var isHidden: Bool
        var value: String
        var image: UIImage
        
        init(_ hidden: Bool = true, value: String, image: UIImage) {
            self.isHidden = hidden
            self.value = value
            self.image = image
        }
    }
    
    class HeaderItem: Item {
        init (value: String, image: UIImage) {
            super.init(false, value: value, image: image)
        }
    }
    
    func append(_ item: Item) {
        self.items.append(item)
    }
}
