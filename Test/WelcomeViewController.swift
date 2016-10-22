//
//  WelcomeViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit
import Foundation
import Firebase

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    var borderWidth: CGFloat = 2.0
    var alpha: CGFloat = 1.0
    var cornerRadius: CGFloat = 10.0
    var email: String = ""
    var password: String = ""
    
    
    
    //var currentUser: BackendlessUser?
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        let user = FIRAuth.auth()?.currentUser
        
        if UserDefaults.standard.value(forKey: "epass") != nil
        {
            let userCredential: FIRAuthCredential = FIREmailPasswordAuthProvider.credential(withEmail: UserDefaults.standard.value(forKey: "epass") as! String, password: UserDefaults.standard.value(forKey: "auth") as! String)
            
            user?.reauthenticate(with: userCredential, completion: { (error) in
                
                if error == nil
                {
                    print("***** user found")
                    
                    DispatchQueue.main.async {
                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
                        
                        vc.selectedIndex = 0
                        
                        self.present(vc, animated: false, completion: nil)
                    }
                }
                    
                else
                {
                    print("**** user not found")
                    
                    try! FIRAuth.auth()?.signOut()
                    
                    UserDefaults.standard.setValue("", forKey: "epass")
                    UserDefaults.standard.setValue("", forKey: "auth")
                }
            })
        }
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
    
    
    func loginUser() {
        
        FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (FIRUser, error) in
            
            if error == nil
            {
                DispatchQueue.main.async {
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
                    
                    vc.selectedIndex = 0
                    
                    self.present(vc, animated: true, completion: nil)
                }
            }
                
            else
            {
                var errorMessage: String
                let errorFound = error as! NSError
                
                
                if errorFound.localizedDescription == "The email address is badly formatted." {
                    errorMessage = "Email format not accepted"
                }
                else if errorFound.localizedDescription == "The password is invalid or the user does not have a password."
                {
                    errorMessage = "The password is incorrect"
                }
                else
                {
                    errorMessage = errorFound.localizedDescription
                }
                
                ProgressHUD.showError(errorMessage)
            }
        })
    }

}
