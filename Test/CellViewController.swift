//
//  CellViewController.swift
//  Test
//
//  Created by Samer Makadicy on 23/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {

    @IBOutlet weak var activityTitleTextField: UITextField!
    @IBOutlet weak var activityTimeTextField: UITextField!
    
    @IBOutlet weak var currentNavigationItem: UINavigationItem!
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        activityTitleTextField.text = activityList[currentRow]
        currentNavigationItem.title = activityList[currentRow]
        
        activityTimeTextField.text = dateList[currentRow]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func doneBarButtonItemPressed(sender: UIBarButtonItem) {
    }
    
    
    @IBAction func cancelBarButtonItemPressed(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
