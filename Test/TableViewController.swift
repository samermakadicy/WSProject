//
//  TableViewController.swift
//  Test
//
//  Created by Samer Makadicy on 31/07/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

let cellID = "cell"


class TableViewController: UITableViewController, UITextViewDelegate {
    
    var pickerVisible = false
    
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var textView: UITextView!


    @IBOutlet weak var activityTextField: UITextField!
    
    @IBOutlet weak var selectedDate: UILabel!
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    @IBAction func datePickerAction(sender: UIDatePicker) {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.stringFromDate(myDatePicker.date)
        self.selectedDate.text = strDate
        
    }
    
    
    @IBAction func addActivityTextField(sender: UIButton) {
        
        if activityTextField != "" {
            activityList.append(activityTextField.text!)
            dateList.append(selectedDate.text!)
            print(activityList)
            print(dateList)
            
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FirstVC") as! UITabBarController
        
        vc.selectedIndex = 1

        self.presentViewController(vc, animated: true, completion: nil)
        
        tabBarController?.selectedIndex = 1

        NSUserDefaults.standardUserDefaults().setObject(activityList, forKey: "activityList")
        NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "Palms.jpg"))
        
        
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

        
        textView.delegate = self
        textView.text = "optional"
        textView.textColor = UIColor.lightGrayColor()
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "segueTest") {
//            let svc = segue.destinationViewController as! ActivityDescriptionController;
//
//            svc.locationField = locationTextField.text
            
//        }
//    }
    
    
    func textViewDidBeginEditing(textView: UITextView) {
        
        if textView.textColor == UIColor.lightGrayColor() {
            
            textView.text = ""
            textView.textColor = UIColor.blackColor()
        }
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        
        if textView.text == "" {
            textView.text = "optional"
            textView.textColor = UIColor.lightGrayColor()
        }
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        activityTextField.resignFirstResponder()
        return true
    }
    
    
    //    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    //        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
    //        header.contentView.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0) //make the background color light blue
    //        header.textLabel!.textColor = UIColor.blackColor() //make the text white
    //       header.alpha = 0.5 //make the header transparent
    //        header.textLabel!.font = UIFont.systemFontOfSize(13.0)
    //(name: "Montserrat", size: 5.0)
    //    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            pickerVisible = !pickerVisible
            tableView.reloadData()
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 2 {
            if pickerVisible == false {
                return 0.0
            }
            return 165.0
        }
        return 44.0
    }
    
    @IBAction func cancelToMyActivitiesViewController(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveActivityDetail(segue:UIStoryboardSegue) {
        //tabBarController?.selectedIndex = 1
        
        
    
    }

    /*
    func switchToDataTab(){
        NSTimer.scheduledTimerWithTimeInterval(0.2,
            target: self,
            selector: "switchToDataTabCont",
            userInfo: nil,
            repeats: false)
    }
    
    func switchToDataTabCont(){
        tabBarController!.selectedIndex = 1
    }
*/
}
