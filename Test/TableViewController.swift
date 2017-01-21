//
//  TableViewController.swift
//  Test
//
//  Created by Samer Makadicy on 31/07/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit
import Firebase

let cellID = "cell"
var FIRReference: FIRDatabaseReference!



class TableViewController: UITableViewController, UITextViewDelegate {
    
    var pickerVisible = false
    var decVisible = false
    
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityTextField: UITextField!
    @IBOutlet weak var selectedDate: UILabel!
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = UIImageView(image: UIImage(named: "Palms.jpg"))
        tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0)
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        descriptionTextView.contentInset = UIEdgeInsetsMake(0,12,0,0)
        
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 10)
        textView.delegate = self
        textView.text = "Optional"
        textView.textColor = UIColor.lightGray
        
        activityTextField.text = ""
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
        if textView.text == "" {
            textView.text = "Optional"
            textView.textColor = UIColor.lightGray
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField!) -> Bool {
        
        activityTextField.resignFirstResponder()
        return true
    }
    
    
    // Date Picker visiblity settings
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(indexPath as NSIndexPath).row == 0 {
            decVisible = !decVisible
            
            tableView.reloadData()
        }
            
        else if (indexPath as NSIndexPath).row == 1 {
            pickerVisible = !pickerVisible
            
            tableView.reloadData()
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Date Picker height settings
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if ((indexPath as NSIndexPath).row == 1 && (indexPath as NSIndexPath).section == 2) {
            
            if decVisible == false {
                return 0.0
            }
            
            return 100.0
        }
        
        else if (indexPath as NSIndexPath).row == 2 {
            if pickerVisible == false {
                return 0.0
            }
            
            return 165.0
        }
        
        return 44.0
    }
    
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        let strDate = dateFormatter.string(from: myDatePicker.date)
        self.selectedDate.text = strDate
    }
    
    @IBAction func saveActivityBarButton(_ sender: AnyObject) {
        
        if activityTextField.text! != "" {
            
            
            let activityTitle = activityTextField.text!
            let activityDate = selectedDate.text!
            
            let newActivity = ActivityItem(activityName: activityTitle, activityDate: activityDate, addedByUser: (FIRAuth.auth()?.currentUser!.email)!)
            
            let activityReference = FIRReference.child(activityTitle.lowercased())
            activityReference.setValue(newActivity.toAnyObject())

            
        
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
            vc.selectedIndex = 1
            self.present(vc, animated: true, completion: nil)
            tabBarController?.selectedIndex = 1
            
            
           // vc.loadView()
        }
    }
    
    
    
    
}
