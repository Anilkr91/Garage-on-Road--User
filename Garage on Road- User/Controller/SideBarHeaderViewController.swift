//
//  SideBarHeaderViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/4/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//


import UIKit

class SideBarHeaderViewController: ViewController {
    
    //Views
    lazy var sideBarHeaderView: SideBarHeaderView! = {
        return Bundle.main.loadNibNamed("SideBarHeaderView", owner: self, options: nil)![0] as! SideBarHeaderView
    }()
    
    override func loadView() {
        view = sideBarHeaderView
    }
}

extension SideBarHeaderViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCurrentUser()
    }
    
    func fetchCurrentUser() {
//        if let json = LoginUtils.getCurrentUserLogin() {
//            if json.user.basicInformation.firstName != nil {
//                sideBarHeaderView.nameLabel.text = (json.user.basicInformation.firstName)! + " " + (json.user.basicInformation.lastName)!
//            }
//            if let url = NSURL(string: (json.user.basicInformation.profilePicture?.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding))!) {
//                
//                self.sideBarHeaderView.menuProfilePic.kf_setImageWithURL(NSURL(string: "\(url)"),placeholderImage: UIImage(named:"account"))
//            }
//        }
    }
}
