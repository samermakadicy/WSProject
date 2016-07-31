//
//  ThirdViewController.swift
//  Test
//
//  Created by Wasan Shubbar on 23/06/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    
    @IBOutlet var activity: UITextField!
    @IBOutlet var activityDesText: UITextView!
    
    
    @IBOutlet var selectedDate: UILabel!
    @IBOutlet var myDatePicker: UIDatePicker!
    @IBAction func datePickerAction(sender: AnyObject) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
    }
    
    
    @IBAction func addActivity(sender: AnyObject) {
        
        activityList.append(activity.text!)
        dateList.append(selectedDate.text!)
        
        NSUserDefaults.standardUserDefaults().setObject(activityList, forKey: "activityList")
        NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
        dismissViewControllerAnimated(true, completion: nil)
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelActivity(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        activity.resignFirstResponder()
        return true
    }
    
}
