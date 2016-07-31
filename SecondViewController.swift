//
//  SecondViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var activityListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        currentRow = indexPath.row
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let currentVC = mainStoryboard.instantiateViewControllerWithIdentifier("activitySelection") as! CellViewController
        self.presentViewController(currentVC, animated:true, completion:nil)
        
        
        print("IP: \(indexPath.row)    currentRow: \(currentRow)")
    }
    
    
    
    override func viewDidAppear(animated: Bool) {
        
        activityListTable.reloadData()
    }

}
