//
//  MainList.swift
//  Kindred
//
//  Created by Administrator on 2/19/18.
//  Copyright © 2018 Administrator. All rights reserved.
//

import UIKit
import RealmSwift


class MainList: UITableViewController {

    let realm = try! Realm()
    
    var activities : Results<Activity>?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        loadactivities()
        
        tableView.separatorStyle = .none
        tableView.rowHeight = 80.0        
      
    }
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities?.count ?? 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        
        cell.textLabel?.text = activities?[indexPath.row].name ?? "No Activities Added Yet"
        
        return cell
    }
    
    
    //MARK: - DATA Manipulation Methods
    
    func save(activity: Activity) {
        
        print("enter save")
        do{
            try realm.write {
                print("try to add")
                realm.add(activity)
            }
        }
        catch{
            print("Error Saving Category: \(error)")
        }
        
        self.tableView.reloadData()
        
    }
    
    
    func loadactivities() {
        
        activities = realm.objects(Activity.self)
        
        tableView.reloadData()
        
    }
    
    
    //MARK: - Add New activities
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textFieldEntry = UITextField()
        
        let alert = UIAlertController(title: "Add New Activity", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Activity", style: .default) { (action) in
            //what will happen when the user clicks the Add Item button on our UIAlert
            
            let newActivity = Activity()
            
            newActivity.name = textFieldEntry.text!
            
            self.save(activity: newActivity)
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Enter Activity..."
            textFieldEntry = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK: - TableView Delegate Methods
    
    
    
    
}
