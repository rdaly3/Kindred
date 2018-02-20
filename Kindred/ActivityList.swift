//
//  ActivityList.swift
//  Kindred
//
//  Created by Administrator on 2/13/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit
import RealmSwift

class ActivityList: UITableViewController {

    let realm = try! Realm()
    
    var activities : Results<Activity>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

         UIApplication.shared.isStatusBarHidden = false
        
        tableView.register(UINib(nibName: "ActivityCell", bundle: nil), forCellReuseIdentifier: "activityCell")
        
    }

    
    // MARK: - Table view data source

   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = super.tableView(tableView, cellForRowAt: indexPath)
        
        if let activity = activities?[indexPath.row]{
            
            cell.textLabel?.text = activity.title ?? "No Activities Yet"
            
            
        }
        
        
        
        return cell
        
    }

   
}
