//
//  RegisterViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var currentNavigationBar: UINavigationBar!
    
    
    var email: String?
    var username: String?
    var password: String?
    var newUser: BackendlessUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newUser = BackendlessUser()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: IBActions
    
    @IBAction func registedBarButtonItemPressed(_ sender: AnyObject) {
        
        if emailTextField.text != "" && usernameTextField.text != "" && passwordTextField.text != "" {
            
            email = emailTextField.text
            username = usernameTextField.text
            password = passwordTextField.text
            
            registerAccount(self.email!, username: self.username!, password: self.password!)
        }
            
        else {
            ProgressHUD.showError("All field are required")
        }
        
    }
    
    func registerAccount(_ email: String, username: String, password: String) {
        
        newUser!.email = email as NSString!
        newUser!.name = username as NSString!
        newUser!.password = password as NSString!
        
        backendless?.userService.registering(newUser, response: { (user: BackendlessUser?) in
            
            ProgressHUD.show("Registering...")
            
            self.loginUser(email, password: password)
            
            }, error: { (error: Fault?) in
                
                ProgressHUD.showError("Registration Failed...")
        })
        
    }
    
    func loginUser(_ email: String, password: String) {
        
        backendless?.userService.login(email, password: password, response: { (user: BackendlessUser?) in
            
            ProgressHUD.dismiss()
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
            
            vc.selectedIndex = 0
            
            self.present(vc, animated: true, completion: nil)
            
            
            }, error: { (error: Fault?) in
                
                ProgressHUD.showError("Login Failed...")
        })
    }
}
