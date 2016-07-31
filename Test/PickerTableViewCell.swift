//
//  PickerTableViewCell.swift
//  Test
//
//  Created by Samer Makadicy on 31/07/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

class PickerTableViewCell: UITableViewCell {
    

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    class var expandedHeight: CGFloat { get { return 200 } }
    class var defaultHeight: CGFloat { get  { return 44  } }
    
    var frameAdded = false
    
    func checkHeight() {
        datePicker.hidden = (frame.size.height < PickerTableViewCell.expandedHeight)
    }
    
    
    func watchFrameChanges() {
    
        datePicker.datePickerMode = UIDatePickerMode.Date
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate: String = dateFormatter.stringFromDate(datePicker.date)
        print(selectedDate)
        
        
        
        if(!frameAdded){
            addObserver(self, forKeyPath: "frame", options: .New, context: nil)
            frameAdded = true
        }
        checkHeight()
    }
    
    func ignoreFrameChanges() {
    
        if (frameAdded) {
            removeObserver(self, forKeyPath: "frame")
            frameAdded = false
        }
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        if keyPath == "frame" {
            checkHeight()
        }
    }
    
    deinit {
        print("deinit called")
        ignoreFrameChanges()
    }
    
}
