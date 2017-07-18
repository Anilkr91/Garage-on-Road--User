//
//  SideMenuOptionsTableViewController.swift
//  TestSegueRouteDemo
//
//  Created by Anil Kumar on 5/4/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

//
//  SideMenuOptionsTableViewController.swift
//  HeartKeeper
//
//  Created by Anil Kumar on 22/08/16.
//  Copyright © 2016 Pronto It Labs. All rights reserved.
//

import UIKit

class SideMenuOptionsTableViewController: UITableViewController {
    
    var sideBarHeaderViewController: SideBarHeaderViewController!
    var indexValue: Int?
    
    @IBOutlet weak var sideBarHeaderView: UIView!
    
    let cells = SideMenu()
    
    override func viewDidLoad() {
        self.setup()
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0)
        if tableView.tableFooterView == nil {
            tableView.tableFooterView = UIView()
        }
        tableView.backgroundColor = UIColor.white
        //        sideBarHeaderViewController = sideBarHeaderViewController()
//        addChildViewController(sideBarHeaderViewController, inView: sideBarHeaderView)
    }
    
    func setup() {
        
        self.cells.append(SideMenu.HeaderItem(value: "Profile", image: UIImage(named: "profile")!))
        self.cells.append(SideMenu.HeaderItem(value: "Hiccups", image: UIImage(named: "profile")!))
        self.cells.append(SideMenu.HeaderItem(value: "Breaking Up & Divorce", image: UIImage(named: "profile")!))
        self.cells.append(SideMenu.HeaderItem(value: "Mood Meter", image: UIImage(named: "profile")!))
        
    }
    
    func setupSegue(_ index: Int) {
        
        if indexValue == index {
            print("you are alraedy in the same vc")
            toggleSideMenuView()
        } else {
            indexValue = index
        let storyboard = UIStoryboard(name: "Main",bundle: nil)
        switch index {
        
        case 0:
            
            let dvc = storyboard.instantiateViewController(withIdentifier: "ProfileTableViewController") as! UINavigationController
             let nvc = dvc.viewControllers[0] as! ProfileTableViewController
            print(dvc)
            print(nvc)
            sideMenuController()?.setContentViewController(nvc)
       
        case 1: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "ProfileTableViewController")
//            sideMenuController()?.setContentViewController(dvc)
            
        case 2: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "HiccupsTableViewController")
//            sideMenuController()?.setContentViewController(dvc)
        case 3: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "BreakupTableViewContoller")
//            sideMenuController()?.setContentViewController(dvc)
        case 4: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "MoodViewController")
//            sideMenuController()?.setContentViewController(dvc)
        case 5: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "DiaryDetailsTableViewContoller")
//            sideMenuController()?.setContentViewController(dvc)
        case 6: break
//            dvc = storyboard.instantiateViewController(withIdentifier: "SupportViewController")
//            sideMenuController()?.setContentViewController(dvc)
        case 7: break

            
        default:
            print("cell out of bound")
            break
        }
        
        }
    }
}

extension SideMenuOptionsTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
         return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return self.cells.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = self.cells.items[indexPath.row]
        let value = item.value as? String
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SideMenuTableViewCell
        cell.sideMenuLabel.text = value
        cell.selectionStyle = .none
        
        if item as? SideMenu.HeaderItem != nil {
            cell.sideMenuLabel!.font = UIFont.systemFont(ofSize: 12.0)
            cell.sideMenuImageView.image = item.image as? UIImage
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        setupSegue(indexPath.row)
     
    }
}
