//
//  SecondViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit
import Firebase

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activityListTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        activityListTable.backgroundColor = UIColor.clear
        
        /*
        if UserDefaults.standard.object(forKey: "activityList") != nil {
            
            activityList = UserDefaults.standard.object(forKey: "activityList") as! [String]
        }
        
        if UserDefaults.standard.object(forKey: "dateList") != nil {
            dateList = UserDefaults.standard.object(forKey: "dateList") as! [String]
        }
        */
        
        FIRReference = FIRDatabase.database().reference()
        
        activityList.removeAll()
        dateList.removeAll()

        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        
        activityListTable.addSubview(refreshControl)
        
        
        didPullToRefresh(refreshControl: refreshControl)
        
        print("**** In view did load")
    }
    

    func didPullToRefresh(refreshControl: UIRefreshControl)
    {
        activityList.removeAll()
        dateList.removeAll()
        activityListTable.reloadData()
        
        
        FIRReference.observe(FIRDataEventType.value, with: { (snapshot) in
            
            for item in snapshot.children
            {
                //print("*** item ***: ", item)
                
                let currentActivity = item as! FIRDataSnapshot
                let value = currentActivity.value as? NSDictionary
                let currentActivityName = value?["activityName"] as? String ?? ""
                let currentActivityDate = value?["activityDate"] as? String ?? ""
                
                //print("^^^^^" + currentActivityName)
                //print("^^^^^" + currentActivityDate)
                
                activityList.append(currentActivityName)
                dateList.append(currentActivityDate)
                self.activityListTable.reloadData()
                
            }
        })
        
        
        
        activityList.removeAll()
        dateList.removeAll()
       
        refreshControl.endRefreshing()
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activityList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = activityList[(indexPath as NSIndexPath).row]
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        cell.detailTextLabel?.text = dateList[(indexPath as NSIndexPath).row]
        cell.detailTextLabel?.font = UIFont.systemFont(ofSize: 14.0)
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            activityList.remove(at: (indexPath as NSIndexPath).row)
            //UserDefaults.standard.set(activityList, forKey: "activityList")
            
            dateList.remove(at: (indexPath as NSIndexPath).row)
            //UserDefaults.standard.set(dateList, forKey: "dateList")
            
            activityListTable.reloadData()
        }
    }

    
   /* override func viewDidAppear(_ animated: Bool) {
        activityList.removeAll()
        dateList.removeAll()

        activityListTable.reloadData()
    }*/
}
