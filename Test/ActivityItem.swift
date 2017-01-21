//
//  ActivityItem.swift
//  Test
//
//  Created by Samer Makadicy on 21/01/2017.
//  Copyright © 2017 Wasan Shubbar. All rights reserved.
//

import Foundation
import Firebase

struct ActivityItem
{
    let key: String
    let activityName: String
    let activityDate: String
    let addedByUser: String
    let ref: FIRDatabaseReference!
    
    
    init(activityName: String, activityDate: String, addedByUser: String, key: String = "")
    {
        self.key = key
        self.activityName = activityName
        self.activityDate = activityDate
        self.addedByUser = addedByUser
        self.ref = nil
    }
    
    init(snapshot: FIRDataSnapshot)
    {
        key = snapshot.key
        let snapshotvalue = snapshot.value as! [String: AnyObject]
        activityName = snapshotvalue["activityName"] as! String
        activityDate = snapshotvalue["activityDate"] as! String
        addedByUser = snapshotvalue["addedByUser"] as! String
        ref = snapshot.ref
    }
    
    func toAnyObject() -> Any
    {
        return[
            "activityName": activityName,
            "activityDate": activityDate,
            "addedByUser": addedByUser
        ]
    }
}
