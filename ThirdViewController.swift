//
//  ThirdViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    
    @IBOutlet weak var currentScrollView: UIScrollView!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var currentNavigationItem: UINavigationItem!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    var selectedDate: String?
    var borderWidth: CGFloat = 0.7
    var cornerRadius: CGFloat = 5.0
    var filter: [String] = []
    
        override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        currentScrollView.scrollEnabled = true

        currentScrollView.contentSize = CGSizeMake(self.view.bounds.width, self.view.bounds.height)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBActions
    
    @IBAction func activityTextFieldPressed(sender: UITextField) {
        
        if activityTextField.text != "" {
            currentNavigationItem.title = activityTextField.text
        }
            
        else {
            currentNavigationItem.title = "New Activity"
        }
    }
    
    
    @IBAction func datePickerPressed(sender: UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        selectedDate = dateFormatter.stringFromDate(datePicker.date)
        
        self.dateLabel.text = "Date:    " + selectedDate!
    }
    
    @IBAction func saveBarButtonItemPressed(sender: AnyObject) {
        
        if activityTextField.text != "" && selectedDate != nil {
            
            
            filter = activityList.filter({(item: String) -> Bool in
            
                let stringMatch = item.lowercaseString.rangeOfString(activityTextField.text!.lowercaseString)
                
                if stringMatch != nil {
                    ProgressHUD.showError("Activity already exists!")
                }
                
                return stringMatch != nil ? true : false
            })
            
            if filter == [] {
             
                print("Saving")
                
                ProgressHUD.show("Saving activity...")
                
                activityList.append(activityTextField.text!)
                dateList.append(selectedDate!)
                
                if locationTextField.text! != "" {
                    locationList.append(locationTextField.text!)
                }
                
                else {
                   locationList.append("nil")
                }
                
                if descriptionTextField.text! != "" {
                    descriptionList.append(descriptionTextField.text!)
                }
                    
                else {
                    descriptionList.append("nil")
                }
                
                NSUserDefaults.standardUserDefaults().setObject(activityList, forKey: "activityList")
                NSUserDefaults.standardUserDefaults().setObject(dateList, forKey: "dateList")
                NSUserDefaults.standardUserDefaults().setObject(locationList, forKey: "locationList")
                NSUserDefaults.standardUserDefaults().setObject(descriptionList, forKey: "descriptionList")
                
                ProgressHUD.dismiss()
                
                dismissViewControllerAnimated(true, completion: nil)
            }
        }
            
        else if activityTextField.text == "" && selectedDate == nil {
            print("Enter activity name and time")
            ProgressHUD.showError("Enter activity name and time")
        }
          
        else if activityTextField.text == "" {
            print("Please name your activity")
            ProgressHUD.showError("Please name your activity")
        }
            
        else if selectedDate == nil {
            print("Please specify the time")
            ProgressHUD.showError("Please specify the time")

        }
    }
    
    
    @IBAction func cancelBarButtonItemPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        activityTextField.resignFirstResponder()
        return true
    }
}
