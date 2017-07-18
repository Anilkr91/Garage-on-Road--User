//
//  SideMenuViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/4/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import Foundation

import UIKit
import ENSwiftSideMenu

class SideMenuViewController: ENSideMenuNavigationController, ENSideMenuDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SideMenuOptionsTableViewController")
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: vc, menuPosition:.left)
        sideMenu?.menuWidth = 250
        sideMenu?.bouncingEnabled = false
        view.bringSubview(toFront: navigationBar)
    }
}
