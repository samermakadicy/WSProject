//
//  WelcomeViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var borderWidth: CGFloat = 2.0
    var alpha: CGFloat = 1.0
    var cornerRadius: CGFloat = 10.0
    
    var currentUser: BackendlessUser?
    
    
    override func viewDidAppear(animated: Bool) {
        
        backendless.userService.setStayLoggedIn(true)
        
        currentUser = backendless.userService.currentUser
        
        
        if currentUser != nil {
            
            print("User is already logged in")
            
            
            dispatch_async(dispatch_get_main_queue()) {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("FirstVC") as! UITabBarController
                
                vc.selectedIndex = 0
                
                self.presentViewController(vc, animated: true, completion: nil)
                
            }
        }
        
        else {
            print("User is NOT logged in")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}
