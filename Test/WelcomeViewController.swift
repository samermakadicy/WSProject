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
    
    //var currentUser: BackendlessUser?
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        //backendless?.userService.setStayLoggedIn(true)
        
        //currentUser = backendless?.userService.currentUser
        
        /*
        if currentUser != nil {
            
            print("User is already logged in")
            
            
            DispatchQueue.main.async {
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
                
                vc.selectedIndex = 0
                
                self.present(vc, animated: true, completion: nil)
                
            }
        }
            
        else {
            print("User is NOT logged in")
        }
        */
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Adding a border to the register and the login buttons
        registerButton.layer.borderWidth = borderWidth
        registerButton.layer.borderColor = UIColor(white: 1.0, alpha: alpha).cgColor
        registerButton.layer.cornerRadius = cornerRadius
        
        loginButton.layer.borderWidth = borderWidth
        loginButton.layer.borderColor = UIColor(white: 1.0, alpha: alpha).cgColor
        loginButton.layer.cornerRadius = cornerRadius
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
}
