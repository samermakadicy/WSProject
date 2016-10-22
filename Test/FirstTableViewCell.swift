//
//  FirstTableViewCell.swift
//  Test
//
//  Created by Samer Makadicy on 15/10/2016.
//  Copyright © 2016 Wasan Shubbar. All rights reserved.
//

import UIKit

class FirstTableViewCell: UITableViewCell {

    @IBOutlet weak var friendName: UILabel!
    @IBOutlet weak var activityTitle: UILabel!
    @IBOutlet weak var activityDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bindData(recent: NSDictionary) {
    
        let withUserId = (recent.object(forKey: "withUserUserId") as? String)!
        
        let whereClause = "objectId = '\(withUserId)'"
        let dataQuery = BackendlessDataQuery()
        
        dataQuery.whereClause = whereClause
        
        let dataStore = backendless?.persistenceService.of(Backendless.ofClass())
        
        dataStore?.find(dataQuery, response: { (users: BackendlessCollection?) in
            
            let withUser = users?.data.first as! BackendlessUser
            
            
            
            
            }, error: { (fault: Fault?) in
                print("Error: \(fault)")
        })
        
        activityTitle.text = recent["withUserUsername"] as? String
        friendName.text = recent[""] as? String
        
        
        
        
    }
}
