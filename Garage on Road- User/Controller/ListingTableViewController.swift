//
//  ListingTableViewController.swift
//  Garage on Road- User
//
//  Created by admin on 02/09/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class ListingTableViewController: UITableViewController {
    
    var dataArray: [ServiceListModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = dataArray[indexPath.section].name
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(indexPath.section)
//        performSegue(withIdentifier: "showDietPlanSegue", sender: self)
//    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func populateTableView() {
        //Loader.sharedInstance.showLoader()
        let param = ["mechanic_type": 3]
        ServiceListGetService.executeRequest(params: param as [String : AnyObject] ) { (data) in
            print(data)
            self.dataArray = data
            self.tableView.reloadData()
           // Loader.sharedInstance.hideLoader()
        }
    }
    
    /*func populateTableView() {
       
        let param = ["mechanic_type": 1]
        AuthorizedServiceListGetService.executeRequest(params: param as [String : AnyObject] ) { (data) in
            print(data)
            //self.dataArray = data
            self.tableView.reloadData()
            // Loader.sharedInstance.hideLoader()
        }
        
    }*/
}
