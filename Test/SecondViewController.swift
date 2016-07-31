//
//  SecondViewController.swift
//  Test
//
//  Created by Wasan Shubbar on 23/06/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

var activityList = [String]()
var dateList = [String]()

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var activityListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if NSUserDefaults.standardUserDefaults().objectForKey("activityList") != nil {
            activityList = NSUserDefaults.standardUserDefaults().objectForKey("activityList") as! [String]

        }
        
        if NSUserDefaults.standardUserDefaults().objectForKey("dateList") != nil {
            dateList = NSUserDefaults.standardUserDefaults().objectForKey("dateList") as! [String]
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return activityList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.text = activityList[indexPath.row]
      //  cell.detailTextLabel?.text = "some text"
        cell.detailTextLabel?.text = dateList[indexPath.row]
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            activityList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(activityList, forKey: "activityList")
            activityListTable.reloadData()
        }
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dateList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        activityListTable.reloadData()
    }


}

