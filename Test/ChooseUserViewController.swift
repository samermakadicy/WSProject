//
//  ChooseUserViewController.swift
//  Test
//
//  Created by Samer Makadicy on 15/10/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

class ChooseUserViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var users: [BackendlessUser] = []
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    //MARK: UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let FriendCell = tableView.dequeueReusableCell(withIdentifier: "friendCell", for: indexPath)
        
        let user = users[indexPath.row]
        
        FriendCell.textLabel?.text = user.name as String?
        
        
        return FriendCell
    }
    
    
    
    
    
    // MARK: IBActions
    
    @IBAction func saveButtonPressed(_ sender: AnyObject) {
    }
    

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
