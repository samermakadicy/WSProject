//
//  SecondViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

var activityList = [String]()
var dateList = [String]()

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activityListTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityListTable.backgroundColor = UIColor.clearColor()
        
        
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
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18.0)
        
        cell.detailTextLabel?.text = dateList[indexPath.row]
        cell.detailTextLabel?.font = UIFont.systemFontOfSize(14.0)
        
        return cell
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            activityList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(activityList, forKey: "activityList")
            
            dateList.removeAtIndex(indexPath.row)
            NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
            
            activityListTable.reloadData()
        }
        
    }
    
    
    override func viewDidAppear(animated: Bool) {
        
        activityListTable.reloadData()
    }
    
}
