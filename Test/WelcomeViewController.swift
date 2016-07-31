//
//  WelcomeViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // Variables used to set the settings for the border of the buttons
    var cornerRadius : CGFloat = 10.0
    var alpha : CGFloat = 10.0
    var borderWidth: CGFloat = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.navigationController?.navigationBarHidden = true
        
        // Adding a border to the register and the login buttons
        registerButton.layer.borderWidth = borderWidth
        registerButton.layer.borderColor = UIColor(white: 1.0, alpha: alpha).CGColor
        registerButton.layer.cornerRadius = cornerRadius
        
        loginButton.layer.borderWidth = borderWidth
        loginButton.layer.borderColor = UIColor(white: 1.0, alpha: alpha).CGColor
        loginButton.layer.cornerRadius = cornerRadius
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
