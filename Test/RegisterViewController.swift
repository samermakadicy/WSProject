//
//  RegisterViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var currentNavigationBar: UINavigationBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBActions
    
    @IBAction func registedBarButtonItemPressed(_ sender: AnyObject) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            registerAccount()
        }
            
        else {
            ProgressHUD.showError("All field are required")
        }
        
    }
    
    func registerAccount() {
        
       
        FIRAuth.auth()?.createUser(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (FIRUser, error) in
            
            if error == nil {
                ProgressHUD.show("User Registered")
                self.loginUser()
            }
            
            else {
                var errorMessage: String
                let errorFound = error as! NSError
                
                
                if errorFound.localizedDescription == "The email address is badly formatted." {
                    errorMessage = "Email format not accepted"
                }
                else
                {
                    errorMessage = errorFound.localizedDescription
                }
                
                ProgressHUD.showError(errorMessage)
            }
        })
        
    }
    
    func loginUser() {
        
        FIRAuth.auth()?.signIn(withEmail: emailTextField.text!, password: passwordTextField.text!, completion: { (FIRUser, error) in
            
            if error == nil
            {
                ProgressHUD.dismiss()
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
                
                vc.selectedIndex = 0
                
                self.present(vc, animated: true, completion: nil)
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
