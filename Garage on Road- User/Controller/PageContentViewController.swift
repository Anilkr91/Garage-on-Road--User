//
//  PageContentViewController.swift
//  CodeBrewMachineTest
//
//  Created by Anil Kumar on 1/14/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit


class PageContentViewController: UIViewController {
    
    var pageIndex: Int = 0
    var image: String!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(imageLiteralResourceName: image)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        print("next")
    }
    
    @IBAction func skipButtonTapped(sender: UIButton) {
      
        print("skip")
    }
}
