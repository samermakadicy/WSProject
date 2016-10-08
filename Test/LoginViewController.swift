//
//  LoginViewController.swift
//  Test
//
//  Created by Samer Makadicy on 12/07/2016.
//  Copyright © 2016 Samer Makadicy. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var email: String?
    var password: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: IBActions
    
    @IBAction func loginBarButtonItemPressed(_ sender: UIBarButtonItem) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            email = emailTextField.text
            password = passwordTextField.text
            
            ProgressHUD.show("Logging in...")
            
            loginUser(self.email!, password: self.password!)
        }
            
        else {
            ProgressHUD.showError("All field are required")
        }
        
    }
    
    func loginUser(_ email: String, password: String) {
        
        backendless?.userService.login(email, password: password, response: { (user: BackendlessUser?) in
            
            ProgressHUD.dismiss()
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FirstVC") as! UITabBarController
            
            vc.selectedIndex = 0
            
            self.present(vc, animated: true, completion: nil)
            
            }, error: { (error: Fault?) in
                
                ProgressHUD.showError("Incorrect Username/Password")
                
        })
        
    }
}
