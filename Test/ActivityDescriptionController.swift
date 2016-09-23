//
//  ActivityDescriptionController.swift
//  Test
//
//  Created by Wasan Shubbar on 19/09/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import Foundation
import UIKit



class ActivityDescriptionController: UIViewController {

    var locationField:String! = ""
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}