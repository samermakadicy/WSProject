//
//  FirstViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var friendsActivityTableView: UITableView!
    var users: [BackendlessUser] = []
    var currentUser: BackendlessUser!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        friendsActivityTableView.backgroundColor = UIColor.clear
        loadUsers()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let activityCell = tableView.dequeueReusableCell(withIdentifier: "friendActivityCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        activityCell.textLabel?.text = user.name as String?
    
        return activityCell
    }
    
    
    
    
    //MARK: Load Backendless Users
    
    func loadUsers() {
        
        //theCurrentUser is the currently found backendlessuser declared in GeneralSettings.swift
        
        let whereClause = "objectId != '\(theCurrentUser?.objectId)'"
        
        let dataQuery = BackendlessDataQuery()
        dataQuery.whereClause = whereClause
        
        let dataStore = backendless?.persistenceService.of(BackendlessUser.ofClass())
        dataStore?.find(dataQuery, response: { (users: BackendlessCollection?) -> Void in
            
            self.users = users?.data as! [BackendlessUser]
            self.friendsActivityTableView.reloadData()
            
            for user in (users?.data)! {
                let u = user as! BackendlessUser
                print(u.name)
                
            }
            
            }, error: { (fault: Fault?) in
                print("Error, Couldn't retreive users: \(fault)")
        })
        
        
    }
    
    
}
